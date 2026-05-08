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

/* pages/management/line.html.twig */
class __TwigTemplate_2ba6c705df43fad249184a57f0928b24 extends Template
{
    private $source;
    private $macros = [];

    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->source = $this->getSourceContext();

        $this->blocks = [
            'more_fields' => [$this, 'block_more_fields'],
        ];
    }

    protected function doGetParent(array $context)
    {
        // line 34
        return "generic_show_form.html.twig";
    }

    protected function doDisplay(array $context, array $blocks = [])
    {
        $macros = $this->macros;
        // line 35
        $macros["fields"] = $this->macros["fields"] = $this->loadTemplate("components/form/fields_macros.html.twig", "pages/management/line.html.twig", 35)->unwrap();
        // line 36
        $context["params"] = (($context["params"]) ?? ([]));
        // line 34
        $this->parent = $this->loadTemplate("generic_show_form.html.twig", "pages/management/line.html.twig", 34);
        yield from $this->parent->unwrap()->yield($context, array_merge($this->blocks, $blocks));
    }

    // line 38
    public function block_more_fields($context, array $blocks = [])
    {
        $macros = $this->macros;
        // line 39
        yield "   ";
        yield CoreExtension::callMacro($macros["fields"], "macro_autoNameField", ["caller_num",         // line 41
($context["item"] ?? null), __("Caller number"),         // line 43
($context["withtemplate"] ?? null)], 39, $context, $this->getSourceContext());
        // line 44
        yield "

   ";
        // line 46
        yield CoreExtension::callMacro($macros["fields"], "macro_autoNameField", ["caller_name",         // line 48
($context["item"] ?? null), __("Caller name"),         // line 50
($context["withtemplate"] ?? null)], 46, $context, $this->getSourceContext());
        // line 51
        yield "

   ";
        // line 53
        yield CoreExtension::callMacro($macros["fields"], "macro_dropdownField", ["LineOperator", "lineoperators_id", (($__internal_compile_0 = CoreExtension::getAttribute($this->env, $this->source,         // line 56
($context["item"] ?? null), "fields", [], "any", false, false, false, 56)) && is_array($__internal_compile_0) || $__internal_compile_0 instanceof ArrayAccess ? ($__internal_compile_0["lineoperators_id"] ?? null) : null), $this->extensions['Glpi\Application\View\Extension\ItemtypeExtension']->getItemtypeName("LineOperator"), ["entity" => (($__internal_compile_1 = CoreExtension::getAttribute($this->env, $this->source,         // line 59
($context["item"] ?? null), "fields", [], "any", false, false, false, 59)) && is_array($__internal_compile_1) || $__internal_compile_1 instanceof ArrayAccess ? ($__internal_compile_1["entities_id"] ?? null) : null)]], 53, $context, $this->getSourceContext());
        // line 61
        yield "
";
        return; yield '';
    }

    /**
     * @codeCoverageIgnore
     */
    public function getTemplateName()
    {
        return "pages/management/line.html.twig";
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
        return array (  77 => 61,  75 => 59,  74 => 56,  73 => 53,  69 => 51,  67 => 50,  66 => 48,  65 => 46,  61 => 44,  59 => 43,  58 => 41,  56 => 39,  52 => 38,  47 => 34,  45 => 36,  43 => 35,  36 => 34,);
    }

    public function getSourceContext()
    {
        return new Source("", "pages/management/line.html.twig", "/home/u981745852/domains/suporteincv.com/public_html/templates/pages/management/line.html.twig");
    }
}
