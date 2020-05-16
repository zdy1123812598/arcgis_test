<template>
  <div id='viewDiv'></div>
</template>
<script>
import { loadModules } from 'esri-loader'

export default {
  name: 'Map',
  data () {
    return {}
  },
  mounted () {
    loadModules([
      'esri/Map',
      'esri/views/SceneView',
      'esri/layers/TileLayer',
      'esri/layers/SceneLayer'
    ])
      .then(([Map, SceneView, TileLayer, SceneLayer]) => {
        const tiled = new TileLayer({
          url:
            'https://server.arcgisonline.com/arcgis/rest/services/World_Imagery/MapServer'
        })
        const building = new SceneLayer({
          url:
            'http://online.deqing.gov.cn/scenelayer/dq_wsc_bm02-20190801-scenelayer/bfba6bb4-f61c-47ba-9d04-751399cd18ca/layers/0'
        })
        let map = new Map({
          logo: false,
          ground: 'world-elevation',
          showAttribution: false,
          // layers: [tiled, building]
          layers: [tiled]
        })

        const view = new SceneView({
          container: 'viewDiv', // Reference to the scene div created in step 5
          map: map, // Reference to the map object created before the scene
          scale: 5000, // Sets the initial scale to 1:50,000,000
          center: [119.929159, 30.574828] // Sets the center point of view with lon/lat
        })
      })
      .catch(err => {
        console.error(err)
      })
  }
}
</script>
<style scoped>

  #viewDiv {
    border: 1px solid red;
    height: 1440px;
    /* height: 1000px; */
  }
</style>
