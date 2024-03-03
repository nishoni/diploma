<template>
  <div class="static bg-base-200 w-full rounded-box">
    <div class="flex justify-center">
      <div class="static w-3/4 m-10 ml-20">
        <label className="input input-bordered flex items-center gap-2">
          <input type="text" className="grow" placeholder="Search" />
        </label>
      </div>
      <div class="static mt-10 ml-0">
        <button className="btn btn-neutral">Search</button>
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
      <div class="static w-1/6 m-10 h-full items-center">
        <div class="bg-base-300 h-full mb-5 p-5 rounded-box">
          here's the statistics
        </div>
        <div class="flex flex-col items-center">
          <button className="btn btn-neutral w-full">CSV export</button>
        </div>
      </div>
    </div>
  </div>
  
</template>
<script>
export default {
  name: 'MainPage'
  
}
</script>
<style lang="">
  
</style>