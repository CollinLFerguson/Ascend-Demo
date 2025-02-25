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
                    text: 'Home',
                    url: '/',
            },
            {
                    startOpen: true,
                    icon: HomeIcon,
                    text: 'Metrics',
                    url: '/',
                    sublinks: []
            },
            {
                startOpen: true,
                icon: HomeIcon,
                text: 'Staff',
                url: '/containers/staff',
            },
            {
                startOpen: true,
                icon: HomeIcon,
                text: 'Caregivers',
                url: '/containers/staff',
            },
            {
                startOpen: true,
                icon: HomeIcon,
                text: 'Children',
                url: '/containers/staff',
            },
            {
                startOpen: true,
                icon: HomeIcon,
                text: 'Administration',
                url: '/containers/staff',
            },
            {
                icon: TemplatesIcon,
                text: 'About Me',
                url: '/containers/aboutme'
            },
        ],
    }
</script>
<svelte:head>
    <title>Ascend Innovations: Demo</title>
    <link rel="icon" type="image/png" href="./src/routes/assets/favicon.ico"/>
</svelte:head>
<Shell>
    <NavBar 
        keepOpen={true}
        openHeaderComponent={NavIcon}
        closedHeaderComponent={NavIcon}
        {navBarContents}
    />
    <Main>
        <div>
            <HeaderBar style="width: 100%; display: flex; justify-content: space-between; align-items: center;">
                    <ProfileButton url="/" />
            </HeaderBar>
        </div>
        <div style="overflow:auto">
        <slot />
        </div>
    </Main>
    <ToastArea />
</Shell>