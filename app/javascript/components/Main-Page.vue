<template>
  <div class="static bg-base-200 w-full rounded-box">
    <div class="flex justify-center">
      <div class="static w-3/4 m-10 ml-20">
        <label className="input input-bordered flex items-center gap-2">
          <input
            type="text"
            className="grow"
            placeholder="Search" 
            @input="(event) => updateField(event)"
          />
        </label>
      </div>
      <div class="static mt-10 ml-0">
        <button className="btn btn-neutral" @click="doSearch">Search</button>
      </div>
    </div>
    <div class="flex justify-evenly">
      <div class="static w-4/6 m-10 bg-base-300 rounded-box">
        <div className="overflow-x-auto">
          <table className="table">
            <thead>
              <tr>
                <th></th>
                <th>Name</th>
                <th>Job</th>
                <th>Age</th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="item in items"
                :key="item"
              >
              <!-- Посмотреть структуру -->
                <th>{{ item.id }}</th>
                <td>{{ item.fullName }}</td>
                <td>{{ item.profession }}</td>
                <td>{{ item.age }}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="static w-1/6 m-10 h-full items-center">
        <div class="flex justify-center bg-base-300 h-full mb-5 p-5 rounded-box">
          <div class="static my-10 mx-5 prose">
            <div class="mb-5"><h1>14 000</h1> объем ответа в Гб</div>
            <div class="mb-5"><h1>14 000</h1> записей в ответе</div>
            <div class="mb-5"><h1>14 000</h1> секунд занял запрос</div>
          </div>
        </div>
        <div class="flex flex-col items-center">
          <button className="btn btn-neutral w-full" @click="csvExport">CSV экспорт</button>
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
      items: {},
      statistics: {},
      search_field: null
    }
  },
  async created() {
    this.items = [{
        id: 1,
        fullName: 'Cy Ganderton',
        profession: 'Quality Control Specialist',
        age: 10
      },
      {
        id: 2,
        fullName: 'Hart Hagerty',
        profession: 'Desktop Support Technician',
        age: 18
      },
      {
        id: 3,
        fullName: 'Brice Swyre',
        profession: 'Tax Accountant',
        age: 20
      }
    ]
  },
  methods: {
    csvExport() {
      axios.post('export', {
        items: this.items
      }).then((response) => {
        console.log(response)
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