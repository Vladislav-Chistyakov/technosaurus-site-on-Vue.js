<template>
<ul class="catalog__list">
  // Передаём массив продуктов в ProductItem
  <ProductItem :products="products"/>
</ul>
</template>

<script>
// Импортируем компонент ProductItem
import ProductItem from './ProductItem.vue';

// берём массив product и принимаем компонент ProductItem
export default {
  props: ['products'],
  components: { ProductItem },
};
</script>
