<template>
  <div class="static bg-base-200 w-full rounded-box">
    <div class="flex justify-center">
      <div class="static w-3/4 m-10 ml-20">
        <label className="input input-bordered flex items-center gap-2">
          <input
            type="text"
            className="grow"
            placeholder="Введите имя" 
            @input="(event) => updateField(event)"
          />
        </label>
      </div>
      <div class="static mt-10 ml-0">
        <button className="btn btn-neutral" @click="doSearch">Поиск</button>
      </div>
    </div>
    <div class="flex justify-evenly">
      <div class="static w-4/6 m-10 bg-base-300 rounded-box">
        <div className="overflow-x-auto">
          <table className="table">
            <thead>
              <tr>
                <th></th>
                <th>Имя</th>
                <th>Коэффициент</th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="item in items"
                :key="item"
              >
              <!-- Посмотреть структуру -->
                <th>{{ item.id }}</th>
                <td>{{ item.full_name }}</td>
                <td>{{ item.coefficient }}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="static w-1/6 m-10 h-full items-center">
        <div class="flex justify-center bg-base-300 h-full mb-5 p-5 rounded-box">
          <div class="static my-10 mx-5 justify-center prose">
            <div class="grid justify-items-center mb-5"><h1>{{ statistics.volume || 0 }}</h1> объем ответа в байтах</div>
            <div class="grid justify-items-center mb-5"><h1>{{ statistics.count || 0 }}</h1> записей в ответе</div>
            <div class="grid justify-items-center mb-5"><h1>{{ statistics.time_perform || 0 }}</h1> секунд занял запрос</div>
          </div>
        </div>
        <div class="flex flex-col items-center">
          <button className="btn btn-neutral w-full" :disabled="!items" @click="csvExport">CSV экспорт</button>
        </div>
      </div>
    </div>
  </div>
  
</template>
<script>
import axios from 'axios'

export default {
  name: 'MainPage',
  data() {
    return {
      items: null,
      statistics: {},
      search_field: null
    }
  },
  methods: {
    csvExport() {
      axios.get('export', {
        params: {
          items: this.items,
          search_field: this.search_field,
        }
      }).then((response) => {
        const blob = new Blob([response.data], { type: 'text/csv;charset=utf-8;' })
        const link = document.createElement('a')
        link.href = URL.createObjectURL(blob)
        link.download = response.headers['content-disposition'].match(/filename="([^"]+)"/)[1]
        link.click()
        URL.revokeObjectURL(link.href)
      }).catch((error) => {
        console.log(error)
      })
    },
    doSearch() {
      axios.post('search', {
        search_field: this.search_field
      }).then((response) => {
        this.items = response.data.items
        this.statistics = response.data.statistics
      }).catch((error) => {
        console.log(error)
      })
    },
    updateField(event) {
      this.search_field = event.target.value
    }
  }
  
}
</script>