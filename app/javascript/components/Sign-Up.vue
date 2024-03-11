<template>
  <div class="grid justify-self-center static bg-base-200 px-5 pb-2 pt-10 rounded-box min-w-2/6">
    <div class="flex justify-center mb-2">
      <label className="input input-bordered flex items-center">
        <input type="text" className="grow" placeholder="Email" />
      </label>
    </div>
    <div class="flex justify-center mb-2">
      <label className="input input-bordered flex items-center">
        <input type="text" className="grow" placeholder="Login" />
      </label>
    </div>
    <div class="flex justify-center mb-2">
      <label className="input input-bordered flex items-center">
        <input type="password" className="grow" placeholder="Password" />
      </label>
    </div>
    <div class="flex justify-center mb-5">
      <label className="input input-bordered flex items-center">
        <input type="password" className="grow" placeholder="Password confirmation" />
      </label>
    </div>
    <div class="flex justify-center mb-2">
      <button className="btn btn-neutral" @click="signUp">Sign Up</button>
    </div>
    <div class="flex justify-center mb-2">
      Already has an account? <button class="btn-link ml-1 mb-5" @click="signInPath">Sign In</button>
    </div>
  </div>
</template>
<script>
import axios from 'axios'
export default {
  name: 'SignUp',
  methods: {
    signInPath() {
      window.location.href = '/sign_in'
    },
    signUp() {
      axios.post('/users', { login: 'frst', password: '123', email: 'test@test.ru' })
      .then((response) => {
        // оч жесткий костыль
        window.location.href = response.data.path
      })
      .catch((error) => {
        console.log(error)
      })
    }
  }
}
</script>
<style>
  
</style>