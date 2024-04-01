<template>
  <div class="static bg-base-200 p-10 w-full rounded-box">
    <div class="static bg-base-300 mb-5 p-5 rounded-box">
      <div class="flex">
        <div class="w-1/5">Коэффициент</div>
        <div class="w-1/5">{{ coefficient }}</div>
        <div class="w-3/5">
          <input 
            type="range"
            min="60"
            max="100"
            :value="coefficient"
            className="range"
            @input="(event) => { this.coefficient = event.target.value }"
          />
        </div>
      </div>
      
    </div>
    <div class="static bg-base-300 mb-5 p-5 rounded-box">
      <div class="flex">
        <div class="w-1/5 justify-center">Максимальное количество результатов</div>
        <div class="w-1/5">{{ maxResultCountInfinite ? 'Без ограничения' : maxResultCount }}</div>
        <div class="w-3/5">
          <input 
            type="range"
            min="10"
            max="100"
            :disabled="maxResultCountInfinite"
            :value="maxResultCount"
            className="range"
            @input="(event) => { this.maxResultCount = event.target.value }"
          />
        </div>
      </div>
      <div class="mt-5">
        <div className="form-control">
          <label className="label cursor-pointer">
            <span className="label-text">Без ограничения</span> 
            <input
              type="checkbox"
              :checked="maxResultCountInfinite"
              className="checkbox"
              @input="maxResultCountInfinite = !maxResultCountInfinite"
            />
          </label>
        </div>
      </div>
    </div>
    <div class="static grid mt-10 justify-items-end">
      <button className="btn btn-neutral" @click="saveSettings">Сохранить</button>
    </div>
  </div>
</template>
<script>
import axios from 'axios';

export default {
  name: 'Search-Settings',
  data() {
    return {
      user: null,
      coefficient: 60,
      maxResultCount: 10,
      maxResultCountInfinite: true
    }
  },

  async created() {
    axios.get('setting_fields').then(response => {
      this.user = response.data.user
      this.coefficient = this.user.coefficient * 100
      if (this.user.max_result_count != -1) {
        this.maxResultCount = this.user.max_result_count
        this.maxResultCountInfinite = false
      }
    })
  },
  methods: {
    saveSettings() {
      console.log('saveSettings')
      axios.post('save_settings', {
        coefficient: this.coefficient,
        max_result_count: this.maxResultCountInfinite ? -1 : this.maxResultCount
      }).then(response => {
        console.log(response)
        this.user = response.data.user
      }).catch(error => {
        console.log(error)
      })
    }
  }
}
</script>
<style>
  
</style>