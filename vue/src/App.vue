<template>
  <component :is="currentPageComponent" :page-params="currentPageParams"/>
</template>

<script>
import MainPage from '@/pages/MainPage.vue';
import ProductPage from '@/pages/ProductPage.vue';
import NotFoundPage from '@/pages/NotFoundPage.vue';
import eventBase from './eventBase';

const routers = {
  main: 'MainPage',
  product: 'ProductPage',
};

export default {
  data() {
    return {
      currentPage: 'main',
      currentPageParams: {},
    };
  },
  methods: {
    gotoPage(pageName, pageParams) {
      this.currentPage = pageName;
      this.currentPageParams = pageParams || {};
    },
  },
  computed: {
    currentPageComponent() {
      return routers[this.currentPage] || 'NotFoundPage';
    },
  },
  components: {
    MainPage,
    ProductPage,
    NotFoundPage,
  },
  created() {
    console.log('cREATED')
    eventBase.$on('gotoPage', (pageName, pageParams) => {
      this.gotoPage(pageName, pageParams)
    })
  },
};
</script>
