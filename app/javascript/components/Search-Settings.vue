<template>
  <div class="static bg-base-200 p-10 w-full rounded-box">
    <div class="static bg-base-300 mb-5 p-5 rounded-box">
      <div>Search koefficient</div>
      <div>{{ user.coefficient }}</div>
    </div>
    <div class="static bg-base-300 mb-5 p-5 rounded-box">
      <div>Max result count</div>
      <div>{{ user.max_result_count }}</div>
    </div>
    <div class="static grid mt-10 justify-items-end">
      <button className="btn btn-neutral" @click="saveSettings">Save</button>
    </div>
  </div>
</template>
<script>
import axios from 'axios';

export default {
  name: 'Search-Settings',
  data() {
    return {
      user: null
    }
  },

  async created() {
    axios.get('setting_fields').then(response => {
      this.user = response.data.user
    })
  },
  methods: {
    saveSettings() {
      console.log('saveSettings')
    }
  }
}
</script>
<style>
  
</style>