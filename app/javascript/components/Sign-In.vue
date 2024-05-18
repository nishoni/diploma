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
    <!-- <div class="flex justify-center mb-2">
      <label className="input input-bordered flex items-center">
        <input type="text" className="grow" placeholder="Email" />
      </label>
    </div>
    <div class="flex justify-center mb-5">
      <label className="input input-bordered flex items-center">
        <input type="password" className="grow" placeholder="Password" />
      </label>
    </div> -->
    <div class="flex justify-center mb-2 mt-3">
      <button className="btn btn-neutral" @click="signIn">Вход</button>
    </div>
    <div class="flex justify-center mb-2">
      Еще нет аккаунта? <button class="btn-link ml-1 mb-5" @click="signUpPath">Зарегистрироваться</button>
    </div>
  </div>
</template>
<script>
import axios from 'axios'

export default {
  name: 'SignIn',
  data() {
    return {
      fields: {
        'email': {
          value: null,
          name: 'email',
          placeholder: 'Email'
        },
        'password': {
          value: null,
          name: 'password',
          placeholder: 'Пароль'
        }
      }
    }
  },
  methods: {
    signUpPath() {
      window.location.href = '/sign_up'
    },
    signIn() {
      console.log('signIn')
      // console.log(this.fields)
      axios.post('/sign_in', {
        password: this.fields['password'].value,
        email: this.fields['email'].value
      }).then((response) => {
        // оч жесткий костыль
        console.log('here')
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