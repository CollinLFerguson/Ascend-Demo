<script>
// @ts-nocheck

	import { Accordion, MainContent, Button, PageBody, Page, Card, NewNotificationIcon } from 'ascend-ui'
    import {GitHubIcon, LinkedInIcon} from '$lib/client/index'

</script>

<Page>
	<PageBody size="full">
        <Card styles={[
            "border: 2px solid var(--primary-200)", 
            "border-radius: 10px","padding-left: 10px","padding-right: 10px", 
            "padding-bottom: 20px", "padding-top: 20px", 
            "box-shadow: 6px 6px 15px rgba(0, 0, 0, 0.3)"
            ]}>
        <div style = "display:flex; flex-direction:column; padding-right: 10px; padding-left:10px; gap:10px;"> 
            <h1>Collin's Really Cool Demo Page!</h1>
            <br>
            <h2> About Me:</h2>
            <p> 
                Hello, my name is Collin Ferguson. I am a Senior at the University of North Dakota and Fullstack developer with 3S Designs. 
                My hobbies include: bodybuilding, tabletop RPGs, video games. One of my favorite things to do is spend the evening hanging out with my girlfriend, usually doing something nerdy. 
            </p>
            <p>
                I don't have a preference for frontend work or backend work, however I love working on optimization problems. I am at my best when I am developing something that will speed up a process that a user interfaces with every day.
            </p>
            <p>
                I dream of becoming a reliable senior software developer, mentor, friend, and father. 
            </p>
            <br>
            <h2> Why Ascend:</h2>
            <p>
                I originally learned about Ascend through a family member that works in the social work industry. After seeing someone from Ascend speak at a conference they gave me the heads-up to look into the company. 
            </p>
            <p>
                After some research, I liked that Ascend develops products that actually have a chance at helping people. Not in a 'make insurance easier to navigate' sort of way, but a community improvement way. That family member explained to me the process of 'legitimizing social work through data' and I thought that would be a rewarding thing to be a part of. I also found that public-facing figures of Ascend strongly believe in a good work/life relationship and put emphasis on being a good parent. 
            </p>
            <p>
                As for the work itself, while I wasn't intimately familiar with the particular frameworks used, I do have skills as a frontend developer. I find small, focused teams very attractive working environments.
            </p>
            <div style="border: 2px solid var(--primary-200); border-radius: 10px; padding-left: 10px; 
            padding-right: 10px; box-shadow: 6px 6px 15px rgba(0, 0, 0, 0.3)">
                <Accordion title="Links To My Stuff">
                    <div style="display:flex">
                        <Button text = "Github" callback={() => window.open("https://github.com/CollinLFerguson", "_blank")} leftIcon={GitHubIcon}/>
                        <Button text = "LinkedIn" callback={() => window.open("https://linkedin.com/in/collin-ferguson-383236219", "_blank")} leftIcon={LinkedInIcon}/>
                    </div>
                </Accordion>
            </div>
        </div>
        </Card>
    </PageBody>
</Page>

