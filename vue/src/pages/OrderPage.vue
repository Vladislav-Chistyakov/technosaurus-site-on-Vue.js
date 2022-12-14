<template>
  <main class="content container">
    <div class="content__top">
      <ul class="breadcrumbs">
        <li class="breadcrumbs__item">
          <a class="breadcrumbs__link" href="index.html">
            Каталог
          </a>
        </li>
        <li class="breadcrumbs__item">
          <a class="breadcrumbs__link" href="cart.html">
            Корзина
          </a>
        </li>
        <li class="breadcrumbs__item">
          <a class="breadcrumbs__link">
            Оформление заказа
          </a>
        </li>
      </ul>

      <h1 class="content__title">
        Корзина
      </h1>
      <span class="content__info" v-if="(amountProducts > 1 && amountProducts <= 4)">
        {{ amountProducts }} товара
      </span>
      <span class="content__info" v-else-if="(amountProducts === 1)">
        {{ amountProducts }} товар
      </span>
      <span class="content__info" v-else>
        {{ amountProducts }} товаров
      </span>
    </div>

    <section class="cart">
      <form @submit.prevent="order()" class="cart__form form" action="#" method="POST">
        <div class="cart__field">
          <div class="cart__data">
            <BaseFormText title="ФИО" v-model="formData.name" type="name" placeholder="Введите ваше полное имя" :error="formError.name"/>
            <BaseFormText title="Адрес доставки" v-model="formData.address" type="text" placeholder="Введите ваш адрес" :error="formError.address"/>
            <BaseFormText title="Телефон" v-model="formData.phone" type="tel" placeholder="Введите ваш телефон" :error="formError.phone"/>
            <BaseFormText title="Email" v-model="formData.email" type="email" placeholder="Введи ваш Email" :error="formError.email"/>
            <BaseFormTexteria title="Комментарий к заказу" v-model="formData.comment" placeholder="Ваши пожелания" :error="formError.comment"/>
          </div>
          <div class="cart__options">
            <h3 class="cart__title">Доставка</h3>
            <ul class="cart__options options">
              <li class="options__item">
                <label class="options__label">
                  <input class="options__radio sr-only" type="radio" name="delivery" value="0" checked="">
                  <span class="options__value">
                    Самовывоз <b>бесплатно</b>
                  </span>
                </label>
              </li>
              <li class="options__item">
                <label class="options__label">
                  <input class="options__radio sr-only" type="radio" name="delivery" value="500">
                  <span class="options__value">
                    Курьером <b>500 ₽</b>
                  </span>
                </label>
              </li>
            </ul>

            <h3 class="cart__title">Оплата</h3>
            <ul class="cart__options options">
              <li class="options__item">
                <label class="options__label">
                  <input class="options__radio sr-only" type="radio" name="pay" value="card">
                  <span class="options__value">
                    Картой при получении
                  </span>
                </label>
              </li>
              <li class="options__item">
                <label class="options__label">
                  <input class="options__radio sr-only" type="radio" name="pay" value="cash">
                  <span class="options__value">
                    Наличными при получении
                  </span>
                </label>
              </li>
            </ul>
          </div>
        </div>

        <OrderOutputWindow :products="products" :final-price="totalPrice"
        :amount-products="amountProducts"/>
        <div class="cart__error form__error-block" v-if="formErrorMessage">
          <h4>Заявка не отправлена!</h4>
          <p>
            {{ formErrorMessage }}
          </p>
        </div>
        <div class="cart__error form__error-block" v-if="sendingApplication">
          <h4>Заявка отправляется!</h4>
        </div>
        <div class="cart__error form__error-block" v-if="acceptanceApplication">
          <h4>Мы приняли вашу заявку!</h4>
        </div>
      </form>
    </section>
  </main>
</template>

<script>

import BaseFormText from '@/components/BaseFormText.vue';
import BaseFormTexteria from '@/components/BaseFormTexteria.vue';
import OrderOutputWindow from '@/components/OrderOutputWindow.vue';
import { API_BASE_URL } from '@/config';
import axios from 'axios';
import { mapGetters } from 'vuex';

 export default {
  components: { BaseFormText, BaseFormTexteria, OrderOutputWindow },
  data() {
    return {
      formData: {},
      formError: {},
      formErrorMessage: '',
      sendingApplication: false,
      acceptanceApplication: false,
    };
  },
  methods: {
    order() {
      this.formError = {};
      this.formErrorMessage = '';
      this.sendingApplication = true;
      clearTimeout(this.time);
        this.time = setTimeout(() => {
          axios.post(API_BASE_URL + '/api/orders', {
        ...this.formData
      }, {
        params: {
          userAccessKey: this.$store.state.userAccessKey
        }
      }).then(response => {
        this.$store.commit('resetCart');
        this.$store.commit('updateOrderInfo', response.data);
        this.$router.push({name: 'orderInfo', params: {id: response.data.id}});
        this.sendingApplication = false;
        this.acceptanceApplication = true;
      })
      .catch(error => {
        this.formError = error.response.data.error.request || {};
        this.formErrorMessage = error.response.data.error.message;
        this.sendingApplication = false;
        this.acceptanceApplication = false;
      });
        }, 2000);
    },
  },
  computed: {
    ...mapGetters({products: 'cartDetailProducts', totalPrice: 'cartTotalPrice', amountProducts: 'cartAmountPrice',}),
  },
 }
</script>
