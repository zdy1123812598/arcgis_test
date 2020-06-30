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
    const options = {
      url: 'https://js.arcgis.com/4.15/'
    }

    loadModules([
      'esri/Map',
      'esri/views/SceneView',
      'esri/layers/SceneLayer',
      'esri/layers/TileLayer',
      'esri/layers/VectorTileLayer',
      'esri/layers/IntegratedMeshLayer'
    ], options)
      .then(([Map, SceneView, SceneLayer, TileLayer, VectorTileLayer, IntegratedMeshLayer]) => {
        const tiled = new TileLayer({
          url:
            'https://server.arcgisonline.com/arcgis/rest/services/World_Imagery/MapServer'
        })
        console.log(tiled)
        const vtlLayer = new VectorTileLayer({
          url: 'https://basemaps.arcgis.com/arcgis/rest/services/World_Basemap_v2/VectorTileServer'
        })
        const building = new SceneLayer({
          url:
            'http://online.deqing.gov.cn/scenelayer/dq_wsc_bm02-20190801-scenelayer/bfba6bb4-f61c-47ba-9d04-751399cd18ca/layers/0'
        })
        console.log(building)
        let map = new Map({
          logo: false,
          ground: 'world-elevation',
          showAttribution: false,
          // layers: [tiled, building]
          layers: [vtlLayer]
        })

        const view = new SceneView({
          container: 'viewDiv', // Reference to the scene div created in step 5
          map: map, // Reference to the map object created before the scene
          scale: 5000, // Sets the initial scale to 1:50,000,000
          center: [119.929159, 30.574828] // Sets the center point of view with lon/lat
        })
        console.log(view)
      })
      .catch(err => {
        console.error(err)
      })
  }
}
</script>
<style scoped>
  @import url('https://js.arcgis.com/4.15/esri/css/themes/light/main.css');
  html,
  body,
  #viewDiv {
    padding: 0;
    margin: 0;
    height: 100%;
    width: 100%;
  }
</style>
