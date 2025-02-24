<script>
	import './styles.css'
    import { AscendLogoIcon, HeaderBar, HomeIcon, Main, NavBar, ProfileButton, Shell, TemplatesIcon, ToastArea } from 'ascend-ui'

    const NavIcon = AscendLogoIcon

    const navBarContents = {
        startOpen: true,
        primaryPageList: [
                {
                    startOpen: true,
                    icon: HomeIcon,
                    text: 'Main Stuff',
                    url: '/',
                    sublinks: [
                        {
                            text: 'Main thing 1',
                            url: '',
                        }
                    ],
                },
                {
                    icon: TemplatesIcon,
                    text: 'Other Stuff',
                    url: '/',
                    sublinks: [
                        {
                            text: 'Main thing 2',
                            url: '',
                        },
                    ],
                },
            ],
        }
</script>

<Shell>
    <NavBar 
        keepOpen={true}
        openHeaderComponent={NavIcon}
        closedHeaderComponent={NavIcon}
        {navBarContents}
    />
    <Main>
        <div style="display:flex; text-align:left;">
            <HeaderBar >
                <h2>Collin Ferguson's Ascend Demo</h2>
            </HeaderBar>
        </div>
        <div style="overflow:auto">
        <slot />
        </div>
    </Main>
    <ToastArea />
</Shell>

