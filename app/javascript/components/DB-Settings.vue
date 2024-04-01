<template>
  <div class="w-full">
    <div class="flex">
      <div class="static w-1/3 bg-base-200 rounded-box mx-5 mr-10">
        <div class="stat place-items-center h-full">
          <div class="stat-title">Зарегистрированных пользователей</div>
          <div class="stat-value mt-5">{{ mainStatistics.usersCount || 0 }}</div>
          <div class="stat-desc mt-5">
            <p>From 1st January to 1st February</p>
            <p>21% more than last month</p>
          </div>
        </div>
      </div>
      <div class="static w-1/3 bg-base-200 rounded-box mx-10 ml-20">
        <div class="stat place-items-center h-full">
          <div class="stat-title">Запросов выполнено</div>
          <div class="stat-value mt-5">{{ mainStatistics.queriesCount || 0 }}</div>
          <div class="stat-desc mt-5">
            <p>From 1st January to 1st February</p>
            <p>21% more than last month</p>
          </div>
        </div>
      </div>
      <div class="static w-1/3 bg-base-200 rounded-box mx-5 ml-20">
        <div class="stat place-items-center h-full">
          <div class="stat-title">Версий БД загружено</div>
          <div class="stat-value mt-5">{{ mainStatistics.versionsCount || 0 }}</div>
          <div class="stat-desc mt-5">
            <p>From 1st January to 1st February</p>
            <p>21% more than last month</p>
          </div>
        </div>
      </div>
    </div>
    <div class="flex justify-evenly">
      <div class="d-flex w-4/5 mx-5 h-full">
        <!-- <div class="flex bg-base-200 rounded-box justify-evenly justify-items-center">
          <div v-for="item in 4" class="d-flex min-w-28 bg-base-300 rounded-box my-2 mx-5">
            <div tabIndex={0} role="button" className="btn btn-ghost btn-circle avatar m-5">
              <div className="rounded-full">
                <img alt="Tailwind CSS Navbar component"
                    src="https://daisyui.com/images/stock/photo-1534528741775-53994a69daeb.jpg"
                />
              </div>
            </div>
            <div class="flex justify-center mb-2">Логин</div>
            <div class="flex justify-center mb-2">Дата входа</div>
          </div>
        </div> -->
        <div class="flex bg-base-200 rounded-box mt-10">
          <div class="static w-full justify-items-center">
            <div class="flex justify-items-center my-10 mx-5 ml-10 prose">
              <h3>Последние загруженные версии</h3>
            </div>
          
            <div class="static m-10 w-5/5 bg-base-300 rounded-box">
              <div className="overflow-x-auto">
                <table className="table">
                  <thead>
                    <tr>
                      <th></th>
                      <th>Name</th>
                      <th>Date</th>
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
                      <td>{{ item.date }}</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          
        </div>
      </div>
      
      <div class="static w-1/5 mx-5 mt-10 align-evenly">
        <div class="static justify-center bg-base-200 rounded-box">
          <div class="flex justify-center">
            <div class="static mx-5 prose">
              <div class="my-5"><h1>14 000</h1> объем БД в Гб</div>
              <div class="mb-5"><h1>14 000</h1> записей БД в Гб</div>
            </div>
          </div>
        </div>

        <div class="static justify-center bg-base-200 rounded-box">
          <div class="flex mt-10 ml-0">
            <div class="static">
              <div class="flex justify-center my-10 mx-5 prose">
                <h3>Загрузить БД</h3>
              </div>
            
              <div class="static m-10 w-5/5">
                <input type="file" class="file-input file-input-bordered w-full max-w-xs"/>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from 'axios'

export default {
  name: 'DBSettings',
  data() {
    return {
      items: null,
      mainStatistics: {},
      usersCount: 0,
      queriesCount: 0,
      versionsCount: 0
    }
  },
  async created() {
    this.items = [{
        id: 1,
        fullName: 'Cy Ganderton',
        date: 'Quality Control Specialist',
        age: 10
      },
      {
        id: 2,
        fullName: 'Hart Hagerty',
        date: 'Desktop Support Technician',
        age: 18
      },
      {
        id: 3,
        fullName: 'Brice Swyre',
        date: 'Tax Accountant',
        age: 20
      },
      {
        id: 3,
        fullName: 'Brice Swyre',
        date: 'Tax Accountant',
        age: 20
      },
      {
        id: 3,
        fullName: 'Brice Swyre',
        date: 'Tax Accountant',
        age: 20
      },
      {
        id: 3,
        fullName: 'Brice Swyre',
        date: 'Tax Accountant',
        age: 20
      },
      {
        id: 3,
        fullName: 'Brice Swyre',
        date: 'Tax Accountant',
        age: 20
      }
    ]
    
  },
  methods: {
    loadDB() {
      console.log('loadDB')
    },
    statisticsGet() {
      axios.get('get_statistics_db')
        .then(response => {
          console.log(response)
          this.mainStatistics = response.data.main_statistics
          // this.usersCount = response.data.users_count
          // this.queriesCount = response.data.queries_count
          // this.versionsCount = response.data.versions_count
        }).catch(error => {
          console.log(error)
        })
    }
  }
}
</script>