<?php

use Twig\Environment;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Extension\CoreExtension;
use Twig\Extension\SandboxExtension;
use Twig\Markup;
use Twig\Sandbox\SecurityError;
use Twig\Sandbox\SecurityNotAllowedTagError;
use Twig\Sandbox\SecurityNotAllowedFilterError;
use Twig\Sandbox\SecurityNotAllowedFunctionError;
use Twig\Source;
use Twig\Template;

/* layout/parts/login/config_login.html.twig */
class __TwigTemplate_aa443ef8be5cd7e83bd78f5051ee6ab5 extends Template
{
    private $source;
    private $macros = [];

    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->source = $this->getSourceContext();

        $this->parent = false;

        $this->blocks = [
            'content_block' => [$this, 'block_content_block'],
            'footer_block' => [$this, 'block_footer_block'],
            'javascript_block' => [$this, 'block_javascript_block'],
        ];
    }

    protected function doDisplay(array $context, array $blocks = [])
    {
        $macros = $this->macros;
        // line 33
        yield "
";
        // line 34
        $context["theme"] = $this->extensions['Glpi\Application\View\Extension\ConfigExtension']->config("palette");
        // line 35
        if ( !array_key_exists("css_files", $context)) {
            // line 36
            yield "   ";
            $context["css_files"] = [["path" => "public/lib/vendor/bootstrap/css/bootstrap.min.css"], ["path" => "public/lib/fonts/font-awesome-4.7.0/css/font-awesome.min.css"], ["path" => "public/lib/fonts/iconic/css/material-design-iconic-font.min.css"], ["path" => "public/lib/vendor/animate/animate.css"], ["path" => "public/lib/vendor/css-hamburgers/hamburgers.min.css"], ["path" => "public/lib/vendor/animsition/css/animsition.min.css"], ["path" => "public/lib/vendor/select2/select2.min.css"], ["path" => "public/lib/vendor/daterangepicker/daterangepicker.css"], ["path" => "public/lib/util.css"], ["path" => "public/lib/main.css"], ["path" => "public/lib/base.js"]];
            // line 50
            yield "   ";
            // line 51
            yield "
";
        }
        // line 53
        yield "
";
        // line 54
        if ( !array_key_exists("js_files", $context)) {
            // line 55
            yield "   ";
            $context["js_files"] = [["path" => "public/lib/vendor/jquery/jquery-3.2.1.min.js"], ["path" => "public/lib/vendor/animsition/js/animsition.min.js"], ["path" => "public/lib/vendor/bootstrap/js/popper.js"], ["path" => "public/lib/vendor/bootstrap/js/bootstrap.min.js"], ["path" => "public/lib/vendor/select2/select2.min.js"], ["path" => "public/lib/vendor/daterangepicker/moment.min.js"], ["path" => "public/lib/vendor/daterangepicker/daterangepicker.js"], ["path" => "public/lib/vendor/countdowntime/countdowntime.js"], ["path" => "public/lib/main.js"]];
        }
        // line 69
        yield "
";
        // line 70
        if ( !array_key_exists("js_files_login", $context)) {
            // line 71
            yield "   ";
            $context["js_files_login"] = [["path" => "public/lib/vendor/jquery/jquery-3.2.1.min.js"], ["path" => "public/lib/vendor/animsition/js/animsition.min.js"], ["path" => "public/lib/vendor/bootstrap/js/popper.js"], ["path" => "public/lib/vendor/bootstrap/js/bootstrap.min.js"], ["path" => "public/lib/vendor/select2/select2.min.js"], ["path" => "public/lib/vendor/daterangepicker/moment.min.js"], ["path" => "public/lib/vendor/daterangepicker/daterangepicker.js"], ["path" => "public/lib/vendor/countdowntime/countdowntime.js"], ["path" => "public/lib/main.js"]];
        }
        // line 85
        if ( !array_key_exists("js_modules", $context)) {
            // line 86
            yield "   ";
            $context["js_modules"] = [];
        }
        // line 88
        if ( !array_key_exists("custom_header_tags", $context)) {
            // line 89
            yield "   ";
            $context["custom_header_tags"] = [];
        }
        // line 91
        yield "
";
        // line 93
        $context["js_modules"] = Twig\Extension\CoreExtension::merge(($context["js_modules"] ?? null), $this->extensions['Glpi\Application\View\Extension\PluginExtension']->getPluginsJsModulesFiles(true));
        // line 94
        yield "
";
        // line 95
        $context["is_anonymous_page"] = true;
        // line 96
        yield "
";
        // line 97
        yield Twig\Extension\CoreExtension::include($this->env, $context, "layout/parts/head.html.twig");
        yield "
<body>
     <div>
     
            ";
        // line 101
        yield from $this->unwrap()->yieldBlock('content_block', $context, $blocks);
        // line 102
        yield "            <div class=\"text-center text-muted mt-3\">
               ";
        // line 103
        yield from $this->unwrap()->yieldBlock('footer_block', $context, $blocks);
        // line 104
        yield "            </div>

     </div>

     ";
        // line 108
        $context['_parent'] = $context;
        $context['_seq'] = CoreExtension::ensureTraversable(($context["js_files_login"] ?? null));
        foreach ($context['_seq'] as $context["_key"] => $context["js"]) {
            // line 109
            yield "         <script src=\"";
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, $context["js"], "path", [], "any", false, false, false, 109), "html", null, true);
            yield "\"></script>
      ";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['js'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 111
        yield "   ";
        yield from $this->unwrap()->yieldBlock('javascript_block', $context, $blocks);
        // line 114
        yield "</body>
</html>


";
        return; yield '';
    }

    // line 101
    public function block_content_block($context, array $blocks = [])
    {
        $macros = $this->macros;
        return; yield '';
    }

    // line 103
    public function block_footer_block($context, array $blocks = [])
    {
        $macros = $this->macros;
        return; yield '';
    }

    // line 111
    public function block_javascript_block($context, array $blocks = [])
    {
        $macros = $this->macros;
        yield "   
   ";
        return; yield '';
    }

    /**
     * @codeCoverageIgnore
     */
    public function getTemplateName()
    {
        return "layout/parts/login/config_login.html.twig";
    }

    /**
     * @codeCoverageIgnore
     */
    public function isTraitable()
    {
        return false;
    }

    /**
     * @codeCoverageIgnore
     */
    public function getDebugInfo()
    {
        return array (  159 => 111,  152 => 103,  145 => 101,  136 => 114,  133 => 111,  124 => 109,  120 => 108,  114 => 104,  112 => 103,  109 => 102,  107 => 101,  100 => 97,  97 => 96,  95 => 95,  92 => 94,  90 => 93,  87 => 91,  83 => 89,  81 => 88,  77 => 86,  75 => 85,  71 => 71,  69 => 70,  66 => 69,  62 => 55,  60 => 54,  57 => 53,  53 => 51,  51 => 50,  48 => 36,  46 => 35,  44 => 34,  41 => 33,);
    }

    public function getSourceContext()
    {
        return new Source("", "layout/parts/login/config_login.html.twig", "C:\\xampp\\htdocs\\GLPI\\templates\\layout\\parts\\login\\config_login.html.twig");
    }
}
