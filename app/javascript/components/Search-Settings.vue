<template>
  <div class="static bg-base-200 p-10 w-full rounded-box">
    <div class="static bg-base-300 mb-5 p-5 rounded-box">
      field example
    </div>
    <div class="static bg-base-300 mb-5 p-5 rounded-box">
      field example
    </div>
    <div class="static grid mt-10 justify-items-end">
      <button className="btn btn-neutral" @click="saveSettings">Save</button>
    </div>
  </div>
</template>
<script>
export default {
  name: 'Search-Settings',
  methods: {
    saveSettings() {
      console.log('saveSettings')
    }
  }
}
</script>
<style>
  
</style>