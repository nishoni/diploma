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
                <th>Favorite Color</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th>1</th>
                <td>Cy Ganderton</td>
                <td>Quality Control Specialist</td>
                <td>Blue</td>
              </tr>
              <tr>
                <th>2</th>
                <td>Hart Hagerty</td>
                <td>Desktop Support Technician</td>
                <td>Purple</td>
              </tr>
              <tr>
                <th>3</th>
                <td>Brice Swyre</td>
                <td>Tax Accountant</td>
                <td>Red</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
  </div>
</template>
<script>
export default {
  name: 'History'
}
</script>
<style>
  
</style>