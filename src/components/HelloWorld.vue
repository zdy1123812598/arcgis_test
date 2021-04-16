<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <h2>arcgis-test</h2>
    <ul>
      <li>
        <a
          href="/static/SceneLayer.html"
          target="_blank"
        >
          SceneLayer
        </a>
      </li>
      <li>
        <a
          href="/static/ViewshedAnalysis.html"
          target="_blank"
        >
          ViewshedAnalysis
        </a>
      </li>
      <li>
        <a
          href="/static/LoadWebScene.html"
          target="_blank"
        >
          LoadWebScene
        </a>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
