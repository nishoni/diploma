<template>
  <div class="static bg-base-200 p-10 w-full rounded-box">
    <div class="flex justify-center">
      <div class="static w-3/4 mr-10 ml-20">
        <label className="input input-bordered flex items-center gap-2">
          <input
            type="text"
            className="grow"
            placeholder="Введите строку"
            @input="(event) => updateField(event)"
          />
        </label>
      </div>
      <div class="static">
        <button className="btn btn-neutral" @click="startSearch">Поиск</button>
      </div>
    </div>
    <!-- Здесь таблица по запросам -->
    <div class="static mt-10 bg-base-300 rounded-box">
        <div className="overflow-x-auto">
          <table className="table">
            <thead>
              <tr class="items-center">
                <th></th>
                <th>Слово</th>
                <th>Время</th>
                <th>Загрузка</th>
                <th>Удаление</th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="query in queries"
                :key="query"
              >
                <th>{{ query.id }}</th>
                <td>{{ query.word }}</td>
                <td>{{ query.time_start }}</td>
                <td>
                  <div class="flex flex-col items-center">
                    <button className="btn btn-neutral" @click="csvExport(query)">CSV экспорт</button>
                  </div>
                </td>
                <td>
                  <div class="flex flex-col items-center">
                    <button className="btn btn-neutral" @click="deleteQuery(query)">Удалить запрос</button>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
  </div>
</template>
<script>
import axios from 'axios'

export default {
  name: 'History',
  data() {
    return {
      queries: null,
      options: {},
      today: null,
      search_field: null
    }
  },
  async created() {
    axios.get('get_queries')
    .then(response => {
      this.queries = response.data.queries
    }).catch(error => {
      console.log(error)
    })
  },
  methods: {
    startSearch() {
      axios.post('history_search', {
        search_field: this.search_field
      }).then(response => {
        this.queries = response.data.queries
      }).catch(error => {
        console.log(error)
      })
    },
    csvExport(query) {
      axios.get('history_export', {
        params: {
          search_field: query.word
        }
      }).then(response => {
        const blob = new Blob([response.data], { type: 'text/csv;charset=utf-8;' })
        const link = document.createElement('a')
        link.href = URL.createObjectURL(blob)
        link.download = response.headers['content-disposition'].match(/filename="([^"]+)"/)[1]
        link.click()
        URL.revokeObjectURL(link.href)
      }).catch(error => {
        console.log(error)
      })
    },
    deleteQuery(query) {
      axios.delete(`queries/${query.id}`).then(response => {
        console.log(response)
      }).catch(error => {
        console.log(error)
      })
    },
    updateField(event) {
      this.search_field = event.target.value
    }
  }
}
</script>
<style>
  
</style>