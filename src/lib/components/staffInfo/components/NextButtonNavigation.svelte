<script>
    import { NextButton } from 'ascend-ui'
    export let row
    export let callback = () => {}
  

  function handleClick(event) {
    // Hack solution to get data from the currently selected row. 
    const parentEl = event.currentTarget.parentElement.parentElement.parentElement

    const children = parentEl.querySelectorAll('*')
    const dbkey = children[0].textContent.trim()
    console.log("child DB:", dbkey)
    
    /*
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
  <NextButton callback={handleClick} />
  <!-- <button type="button" on:click={handleClick}>Click Me</button>-->
  