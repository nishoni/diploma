<template lang="">
  <div className="navbar bg-base-200">
    <div className="flex-1">
      <!-- Зменить на название сайта, добавить ссылку на главную страницу -->
      <a className="btn btn-ghost text-xl" @click="mainPath">UnDefinition</a>
    </div>
    <div className="flex-none gap-2">
      <div>
        Приветствуем, {{ userName }}!
      </div>
      <div className="dropdown dropdown-end">
        <div tabIndex={0} role="button" className="btn btn-ghost btn-circle avatar">
          <div className="w-10 rounded-full">
            <img alt="Here was Vasya" src="https://ibb.co/FbGyPNn" />
          </div>
        </div>
        <ul tabIndex={0} className="mt-3 z-[1] p-2 shadow menu menu-sm dropdown-content bg-base-100 rounded-box w-52">
          <li><a @click="logout">Выйти</a></li>
        </ul>
    </div>
  </div>
</div>
  
</template>
<script>
import axios from 'axios'

export default {
  name: 'Navbar',
  data() {
    return {
      userName: 'stranger'
    }
  },

  async created() {
    axios.get('get_user_info').then(response => {
      this.userName = response.data.name
    })
  },

  computed: {
    mainPath() {
      window.location.href = '/'
    }
  },
  methods: {
    logout() {
      axios.delete('/logout').then((response) => {
        window.location.href = response.data.path
      })
    }
  }
}
</script>