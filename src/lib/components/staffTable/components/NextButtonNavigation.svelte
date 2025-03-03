<script>
    import { goto } from '$app/navigation';
    import { NextButton } from 'ascend-ui'
    export let row
    export let callback = () => {}
  

  function handleClick(event) {
    // Hack solution to get data from the currently selected row. 
    const parentElement = event.currentTarget.parentElement.parentElement.parentElement

    const children = parentElement.querySelectorAll('*')
    const dbkey = children[0].textContent.trim()
    console.log("child DB:", dbkey)

    goto(`/containers/staff-info/${dbkey}`)
    
    /*
    //if I needed any other text.
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
  