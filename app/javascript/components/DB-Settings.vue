<template>
  <div class="w-full">
    <div class="flex justify-evenly">
      <div class="static w-1/3 bg-base-200 rounded-box mx-10 ml-20">
        <div class="d-flex justify-evenly my-10 mx-5 prose">
          <h1>14 000</h1>
          <h3>Зарегистрированных пользователей</h3>
        </div>
      </div>
      <div class="static w-1/3 bg-base-200 rounded-box mx-10 ml-20">
        <div class="d-flex justify-center my-10 mx-5 prose">
          <h1>20 000</h1>
          <h3>Запросов выполнено</h3>
        </div>
      </div>
      <div class="static w-1/3 bg-base-200 rounded-box mx-10 ml-20">
        <div class="d-flex justify-center my-10 mx-5 prose">
          <h1>30 000</h1>
          <h3>Версий БД загружено</h3>
        </div>
      </div>
    </div>
    <div class="flex justify-evenly">
      <div class="d-flex w-4/5 mx-5 mt-10">
        <div class="flex bg-base-200 rounded-box justify-evenly justify-items-center">
          <div v-for="item in 10" class="d-flex min-w-28 bg-base-300 rounded-box my-2 mx-5">
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
        </div>
        <div class="flex bg-base-200 rounded-box mt-10">
          <div class="static w-full justify-items-center">
            <div class="flex justify-items-center my-10 mx-5 prose">
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
      
      <div class="static w-1/5 mx-5 mt-10">
        <div class="static justify-center bg-base-200 rounded-box">
          <div class="flex justify-center">
            <div class="static my-10 mx-5 prose">
              <div class="mb-5"><h1>14 000</h1> объем БД в Гб</div>
              <div class="mb-5"><h1>14 000</h1> записей БД в Гб</div>
              <div class="mb-5"><h1>14 000</h1> объем БД в Гб</div>
            </div>
          </div>
        </div>

        <div class="static mt-10 ml-0">
          <button className="btn btn-neutral w-full">Загрузить БД</button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'DBSettings',
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
      }
    ]
  }
}
</script>