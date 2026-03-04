<div class="footer">
    <div class="container">
        <div class="row text-center border-top">
            <span><a href="https://xjec.com/cn/" target="_blank">{{i18n .Lang "common.official_website"}}</a></span>
            <span>&nbsp;·&nbsp;</span>
            <span><a href="https://hmi.lsieens.top:35443/core/auth/login/" target="_blank">{{i18n .Lang "common.feedback"}}</a></span>
            <span>&nbsp;·&nbsp;</span>
            <span><a href="https://github.com/mindoc-org/mindoc" target="_blank">{{i18n .Lang "common.source_code"}}</a></span>
            <span>&nbsp;·&nbsp;</span>
            <span><a href="https://hmi.lsieens.top:35100/login" target="_blank">{{i18n .Lang "common.manual"}}</a></span>
        </div>
        {{if .site_beian}}
        <div class="row text-center">
            <a href="https://beian.miit.gov.cn/" target="_blank">{{.site_beian}}</a>
        </div>
        {{end}}
    </div>
</div>
