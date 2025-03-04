<script>
    import { ArrowRightExtraSmallIcon, ArrowRightSmallIcon, LinkButton, NextButton } from 'ascend-ui'
    export let row
    export let callback = () => {}
  

  function handleClick(event) {
    // Hack solution to get data from the currently selected row. 
    console.log("hello")
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
  <div style="height:30px; align-content:center">
    <LinkButton on:click={handleClick} rightIcon={ArrowRightExtraSmallIcon}/>
</div>
  <!-- <button type="button" on:click={handleClick}>Click Me</button>-->
  