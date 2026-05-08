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

/* pages/login.html.twig */
class __TwigTemplate_a016ae1c8d16e6363376b774b8fa870f extends Template
{
    private $source;
    private $macros = [];

    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->source = $this->getSourceContext();

        $this->blocks = [
            'content_block' => [$this, 'block_content_block'],
            'footer_block' => [$this, 'block_footer_block'],
            'javascript_block' => [$this, 'block_javascript_block'],
        ];
    }

    protected function doGetParent(array $context)
    {
        // line 34
        return "layout/parts/login/config_login.html.twig";
    }

    protected function doDisplay(array $context, array $blocks = [])
    {
        $macros = $this->macros;
        $this->parent = $this->loadTemplate("layout/parts/login/config_login.html.twig", "pages/login.html.twig", 34);
        yield from $this->parent->unwrap()->yield($context, array_merge($this->blocks, $blocks));
    }

    // line 36
    public function block_content_block($context, array $blocks = [])
    {
        $macros = $this->macros;
        // line 37
        yield "  
         <div class=\"limiter\">
            <div class=\"container-login100\">
               <div class=\"wrap-login100\">
               <form action=\"";
        // line 41
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->extensions['Glpi\Application\View\Extension\RoutingExtension']->path("front/login.php"), "html", null, true);
        yield "\" method=\"post\" autocomplete=\"off\"  data-submit-once>
                  <input type=\"hidden\" name=\"noAUTO\" value=\"";
        // line 42
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(($context["noAuto"] ?? null), "html", null, true);
        yield "\" />
                 <input type=\"hidden\" name=\"redirect\" value=\"";
        // line 43
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(($context["redirect"] ?? null), "html", null, true);
        yield "\" />
                  <input type=\"hidden\" name=\"_glpi_csrf_token\" value=\"";
        // line 44
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(Session::getNewCSRFToken(), "html", null, true);
        yield "\" />
                  
                     <span class=\"login100-form-title p-b-48\">
                        
                        <img src=\"public/images/logo-GLPI-100-black.png\" alt=\"\">
                     </span>

                     <div class=\"wrap-input100 validate-input\" data-validate = \"Valid email is: a@b.c\">
                        <input class=\"input100\" type=\"text\" name=\"email\">
                        <span class=\"focus-input100\" data-placeholder=\"Email\"></span>
                     </div>

                     <div class=\"wrap-input100 validate-input\" data-validate=\"Enter password\">
                        <span class=\"btn-show-pass\">
                           <i class=\"zmdi zmdi-eye\"></i>
                        </span>
                        <input class=\"input100\" type=\"password\" name=\"pass\">
                        <span class=\"focus-input100\" data-placeholder=\"Password\"></span>
                     </div>

                     <div class=\"container-login100-form-btn\">
                        <div class=\"wrap-login100-form-btn\">
                           <div class=\"login100-form-bgbtn\"></div>
                           <button class=\"login100-form-btn\">
                              Login
                           </button>
                        </div>
                     </div>

                     <div class=\"text-center p-t-115\">
                        <span class=\"txt1\">
                           Don’t have an account?
                        </span>

                        <a class=\"txt2\" href=\"#\">
                           Sign Up
                        </a>
                     </div>
                  </form>
               </div>
            </div>
         </div>
         

         <div id=\"dropDownSelect1\"></div>
";
        return; yield '';
    }

    // line 91
    public function block_footer_block($context, array $blocks = [])
    {
        $macros = $this->macros;
        // line 92
        yield "   ";
        yield ($context["copyright_message"] ?? null);
        yield "
";
        return; yield '';
    }

    // line 95
    public function block_javascript_block($context, array $blocks = [])
    {
        $macros = $this->macros;
        yield "<script type=\"text/javascript\">
   \$(function () {
\$('#login_name').focus();
});
</script>
";
        return; yield '';
    }

    /**
     * @codeCoverageIgnore
     */
    public function getTemplateName()
    {
        return "pages/login.html.twig";
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
        return array (  134 => 95,  126 => 92,  122 => 91,  71 => 44,  67 => 43,  63 => 42,  59 => 41,  53 => 37,  49 => 36,  38 => 34,);
    }

    public function getSourceContext()
    {
        return new Source("", "pages/login.html.twig", "C:\\xampp\\htdocs\\GLPI\\templates\\pages\\login.html.twig");
    }
}
