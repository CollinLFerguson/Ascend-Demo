<script>
    import { NextButton } from 'ascend-ui'
    export let row
    export let callback = () => {}
  

  function handleClick(event) {
    /*
    const parentEl = event.currentTarget.parentElement.parentElement.parentElement

    const children = parentEl.querySelectorAll('*')
    children.forEach(child => {
      const text = child.textContent.trim()
      if (text) {
        console.log(text)
      }
      // my api call(text)
    })
      */
  }



  </script>
  
  <button type="button" on:click={handleClick}>Click Me</button>
  