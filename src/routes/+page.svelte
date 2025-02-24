<script>
	import { Accordion, MainContent, Button, PageBody, Page } from 'ascend-ui'
    import {GitHubIcon} from '$lib/index'


    const openCollinsGit = () => {
        window.open("https://github.com/CollinLFerguson", "_blank")
    }
/*leftIcon={GitHubIcon}*/
</script>

<Page>
	<PageBody size="full">
        <div > 
            <h1>Collin's Really Cool Demo Page!</h1>
            <h2> About Me:</h2>
            <p> 
                Hello, my name is Collin Ferguson. I am a Senior at the University Of North Dakota and Fullstack developer with 3S Designs. My hobbies include: bodybuilding, tabletop RPGS, video games. One of my favorite things to do is spend the evening hanging out with my girlfriend, usually doing something nerdy. 

                I don't have a preference for frontend work or backend work, however I love working on optimization problems. I am at my best when I am developing something that will speed up a process that a user interfaces with every day.

                I dream of becoming a reliable senior software developer, mentor, friend, and father. 
            </p>
            <br>
            <br>
            <h2> Why Ascend:</h2>
            <p>
                I originally learned about Ascend through a family member that works in the social work industry. After seeing someone from Ascend speak at a conference they gave me the heads up to look into the company. 

                After some research, I liked that Ascend develops products that actually have a chance at helping people. Not in a 'make insurance easier to navigate' sort of way, but a community improvement way. That family member explained to me the process of 'legitimizing social work through data' and I thought that would be a rewarding thing to be a part of. I also found that public facing figures of Ascend strongly belive in a good work / life relationship, and put emphasis on being a good parent. 

                As for the work, I found that while I wasn't intimately familiar with the particular frameworks chosen, I do have skills as a frontend developer. I have experience working in small teams - and would like to keep working in small teams for the time being. 
            </p>

            <Accordion title="Links To My Stuff">
                <div style="display:flex">
                    <Button text = "github" callback={() => window.open("https://github.com/CollinLFerguson", "_blank")} leftIcon={GitHubIcon}/>
                    <Button text = "LinkedIn" callback={() => window.open("https://linkedin.com/in/collin-ferguson-383236219", "_blank")} leftIcon={GitHubIcon}/>
                </div>

            </Accordion>
        </div>
    </PageBody>
</Page>

