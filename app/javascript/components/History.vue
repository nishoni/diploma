<template>
  <div class="static bg-base-200 p-10 w-full rounded-box">
    <div class="flex justify-center">
      <div class="static w-3/4 mr-10 ml-20">
        <label className="input input-bordered flex items-center gap-2">
          <input type="text" className="grow" placeholder="Search" />
        </label>
      </div>
      <div class="static">
        <button className="btn btn-neutral">Search</button>
      </div>
    </div>
    <!-- Здесь таблица по запросам -->
    <div class="static mt-10 bg-base-300 rounded-box">
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
  </div>
</template>
<script>
export default {
  name: 'History',
  data() {
    return {
      items: null
    }
  },
  async created() {
    console.log('hi')
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
  }
}
</script>
<style>
  
</style>