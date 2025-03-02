<script>
    import { browser } from '$app/environment';
    import { goto } from '$app/navigation';
    import { AscendLogoIcon, HeaderBar, HomeIcon, Main, NavBar, ProfileButton, Shell, TemplatesIcon, ToastArea } from 'ascend-ui'
    import { authStore } from '../../stores/authStore';
    

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
    
    function customURL(){
        goto("/auth")
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
        <div style="overflow:auto">
            <HeaderBar style="width: 100%; display: flex; justify-content: space-between; align-items: center;">
                    <ProfileButton callback={customURL}/>
            </HeaderBar>
        </div>
        <div >
        <slot />
        </div>
    </Main>
    <ToastArea />
</Shell>