<template>
  <div v-if="showSidebar" class="static">
    <ul className="menu bg-base-200 mt-10 ml-5 w-full rounded-box">
      <li><a @click="mainPath">Main</a></li>
      <li><a @click="historyPath">History</a></li>
      <li><a @click="searchPath">Search Settings</a></li>
      <li><a @click="dBPath">DB Settings</a></li>
    </ul>
  </div>
</template>
<script>
export default {
  name: 'Sidebar',

  computed: {
    showSidebar() {
      return window.location.pathname !== '/sign_in' && window.location.pathname !== '/sign_up'
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