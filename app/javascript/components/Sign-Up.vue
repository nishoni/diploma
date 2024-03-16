<template>
  <div class="grid justify-self-center static bg-base-200 px-5 pb-2 pt-10 rounded-box min-w-2/6">
    <div v-for="field in fields" :key="field.name">
      <div class="flex justify-center mb-2">
        <label className="input input-bordered flex items-center">
          <input
            :type="isPassword(field.name) === true ? 'password' : 'text'"
            :placeholder="field.placeholder"
            @input="(event) => updateField(field, event)"
          />
        </label>
      </div>
    </div>
    <div class="flex justify-center mb-2 mt-3">
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
  data() {
    return {
      fields: {
        'email': {
          value: null,
          name: 'email',
          placeholder: 'Email'
        },
        'login': {
          value: null,
          name: 'login',
          placeholder: 'Login'
        },
        'password': {
          value: null,
          name: 'password',
          placeholder: 'Password'
        },
        'password_conf': {
          value: null,
          name: 'password_conf',
          placeholder: 'Password Confirmation'
        },
      }
    }
  },
  methods: {
    signInPath() {
      window.location.href = '/sign_in'
    },
    signUp() {
      axios.post('/users', {
        login: this.fields['login'].value,
        password: this.fields['password'].value,
        email: this.fields['email'].value
      }).then((response) => {
        // оч жесткий костыль
        window.location.href = response.data.path
      })
      .catch((error) => {
        console.log(error)
      })
    },
    isPassword(name) {
      return name === 'password' || name === 'password_conf'
    },
    updateField(field, event) {
      field.value = event.target.value
    }
  }
}
</script>
<style>
  
</style>