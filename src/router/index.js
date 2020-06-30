import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Map from '@/components/Map'
import SceneView from '@/components/SceneView'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    }, {
      path: '/map',
      name: 'Map',
      component: Map
    }, {
      path: '/sceneView',
      name: 'SceneView',
      component: SceneView
    }
  ]
})
