<template>
  <div v-if="showSidebar" class="static">
    <ul className="menu bg-base-200 mt-10 ml-5 w-full rounded-box">
      <li><a @click="mainPath">Главная</a></li>
      <li><a @click="historyPath">История</a></li>
      <li><a @click="searchPath">Настройки поиска</a></li>
      <li v-if="userRole === 1"><a @click="dBPath">Настройки БД</a></li>
    </ul>
  </div>
</template>
<script>
import axios from 'axios'

export default {
  name: 'Sidebar',

  data() {
    return {
      userRole: 0
    }
  },

  created() {
    axios.get('get_user_info').then((response) => {
      this.userRole = response.data.role
    })
    console.log(this.userRole)
  },

  computed: {
    showSidebar() {
      return window.location.pathname !== '/sign_up' && window.location.pathname !== '/sign_in'
    }
  },

  methods: {
    mainPath() {
      // this.$route и this.$http не работают
      // разобраться, почему
      window.location.href = '/';
    },
    historyPath() {
      window.location.href = '/queries';
    },
    searchPath() {
      window.location.href = '/search_settings';
    },
    dBPath() {
      // ??????????
      window.location.href = '/db_settings';
    }
  }
}
</script>
<style scoped>
  /* div {
    align: center;
  } */
</style>