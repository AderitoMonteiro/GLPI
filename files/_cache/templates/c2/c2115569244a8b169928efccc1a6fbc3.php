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

/* layout/parts/page_header.html.twig */
class __TwigTemplate_2e39aac5e0f619dfd12d45810086a24c extends Template
{
    private $source;
    private $macros = [];

    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->source = $this->getSourceContext();

        $this->parent = false;

        $this->blocks = [
        ];
    }

    protected function doDisplay(array $context, array $blocks = [])
    {
        $macros = $this->macros;
        // line 33
        yield "
";
        // line 34
        $context["anonymous"] = (null === $this->extensions['Glpi\Application\View\Extension\SessionExtension']->session("glpiactiveprofile"));
        // line 35
        yield "
";
        // line 36
        $context["is_vertical"] = ($this->extensions['Glpi\Application\View\Extension\SessionExtension']->userPref("page_layout") == "vertical");
        // line 37
        yield "
<body class=\"";
        // line 38
        yield ((($this->extensions['Glpi\Application\View\Extension\SessionExtension']->userPref("fold_menu") && ($context["is_vertical"] ?? null))) ? ("navbar-collapsed") : (""));
        yield " ";
        yield ((($context["is_vertical"] ?? null)) ? ("vertical-layout") : ("horizontal-layout"));
        yield " ";
        yield ((($context["is_debug_active"] ?? null)) ? ("debug-active") : (""));
        yield "\">
   ";
        // line 39
        if ((Twig\Extension\CoreExtension::constantIsDefined("SKIP_UPDATES") && ($this->extensions['Glpi\Application\View\Extension\PhpExtension']->call("Update::isDbUpToDate") == false))) {
            // line 40
            yield "      <div class=\"banner-need-update\">
         ";
            // line 41
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("You are bypassing a needed update"), "html", null, true);
            yield "
      </div>
   ";
        }
        // line 44
        yield "   ";
        yield Twig\Extension\CoreExtension::include($this->env, $context, "layout/parts/impersonate_banner.html.twig");
        yield "
   ";
        // line 45
        yield Twig\Extension\CoreExtension::include($this->env, $context, "components/messages_after_redirect_toasts.html.twig", ["display_container" => true]);
        yield "

   <div class=\"page\">

      ";
        // line 49
        if (($context["is_vertical"] ?? null)) {
            // line 50
            yield "      <aside class=\"navbar navbar-vertical navbar-expand-lg sticky-lg-top sidebar\">
         <div class=\"container-fluid\">
            <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbar-menu\">
               <span class=\"navbar-toggler-icon\"></span>
            </button>

            <a href=\"";
            // line 56
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->extensions['Glpi\Application\View\Extension\RoutingExtension']->indexPath(), "html", null, true);
            yield "\" accesskey=\"1\" title=\"";
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Home"), "html", null, true);
            yield "\"
               class=\"navbar-brand\">
               <span class=\"glpi-logo\"></span>
            </a>

            ";
            // line 61
            if ( !($context["anonymous"] ?? null)) {
                // line 62
                yield "               <span class=\"d-none d-lg-inline-block\">
                   ";
                // line 63
                yield Twig\Extension\CoreExtension::include($this->env, $context, "layout/parts/goto_button.html.twig");
                yield "
               </span>
            ";
            }
            // line 66
            yield "
            ";
            // line 67
            if ( !(null === ($context["user"] ?? null))) {
                // line 68
                yield "               ";
                // line 69
                yield "               <div class=\"d-lg-none\">
                  ";
                // line 70
                yield Twig\Extension\CoreExtension::include($this->env, $context, "layout/parts/user_header.html.twig");
                yield "
               </div>
            ";
            }
            // line 73
            yield "
            ";
            // line 74
            if ( !($context["anonymous"] ?? null)) {
                // line 75
                yield "               <div class=\"collapse navbar-collapse\" id=\"navbar-menu\">
                   <span class=\"d-inline-block d-lg-none ms-2\">
                       ";
                // line 77
                yield Twig\Extension\CoreExtension::include($this->env, $context, "layout/parts/goto_button.html.twig");
                yield "
                   </span>
                   ";
                // line 79
                yield Twig\Extension\CoreExtension::include($this->env, $context, "layout/parts/menu.html.twig");
                yield "


                  <p class=\"text-start\">
                     <button class=\"btn btn-sm btn-ghost-secondary  ";
                // line 83
                yield ((($context["is_debug_active"] ?? null)) ? ("mb-4") : ("mb-2"));
                yield " reduce-menu d-none d-md-block\">
                        <span class=\"menu-label\">";
                // line 84
                yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Collapse menu"), "html", null, true);
                yield "</span>
                     </button>
                  </p>
               </div>
            ";
            }
            // line 89
            yield "         </div>
      </aside>
      ";
        }
        // line 92
        yield "
      <header class=\"navbar d-print-none sticky-lg-top shadow-sm ";
        // line 93
        yield ((($this->extensions['Glpi\Application\View\Extension\SessionExtension']->userPref("page_layout") == "vertical")) ? ("navbar-light navbar-expand-md") : ("navbar-dark navbar-expand-xl topbar"));
        yield "\">
         <div class=\"container-fluid flex-xl-nowrap pe-xl-0\">
            ";
        // line 95
        if (($this->extensions['Glpi\Application\View\Extension\SessionExtension']->userPref("page_layout") == "vertical")) {
            // line 96
            yield "               ";
            yield Twig\Extension\CoreExtension::include($this->env, $context, "layout/parts/breadcrumbs.html.twig");
            yield "

                <div class=\"ms-lg-auto d-none d-lg-block flex-grow-1 flex-lg-grow-0\">
                     ";
            // line 99
            yield Twig\Extension\CoreExtension::include($this->env, $context, "layout/parts/global_search_form.html.twig");
            yield "
                </div>

            ";
        } elseif (($this->extensions['Glpi\Application\View\Extension\SessionExtension']->userPref("page_layout") == "horizontal")) {
            // line 103
            yield "               <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbar-menu\">
                  <span class=\"navbar-toggler-icon\"></span>
               </button>

               <a href=\"";
            // line 107
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->extensions['Glpi\Application\View\Extension\RoutingExtension']->indexPath(), "html", null, true);
            yield "\" accesskey=\"1\" title=\"";
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(__("Home"), "html", null, true);
            yield "\"
                  class=\"navbar-brand\">
                  <span class=\"glpi-logo\"></span>
               </a>

               <div class=\"d-lg-none\">
                  ";
            // line 113
            yield Twig\Extension\CoreExtension::include($this->env, $context, "layout/parts/user_header.html.twig");
            yield "
               </div>

               <div class=\"collapse navbar-collapse justify-content-center\" id=\"navbar-menu\">
                  ";
            // line 117
            yield Twig\Extension\CoreExtension::include($this->env, $context, "layout/parts/menu.html.twig");
            yield "
                  <span class=\"ms-xl-2 d-inline-block mt-2 mt-xl-2\">
                     ";
            // line 119
            yield Twig\Extension\CoreExtension::include($this->env, $context, "layout/parts/goto_button.html.twig");
            yield "
                  </span>
               </div>
            ";
        }
        // line 123
        yield "
            <div class=\"ms-md-4 d-none d-lg-block\">
               ";
        // line 125
        yield Twig\Extension\CoreExtension::include($this->env, $context, "layout/parts/user_header.html.twig");
        yield "
            </div>
         </div>
      </header>

      ";
        // line 130
        if (($this->extensions['Glpi\Application\View\Extension\SessionExtension']->userPref("page_layout") == "horizontal")) {
            // line 131
            yield "      <div class=\"navbar navbar-expand-md navbar-light secondary-bar sticky-md-top shadow-sm\">
         <div class=\"container-fluid justify-content-start\">
            ";
            // line 133
            yield Twig\Extension\CoreExtension::include($this->env, $context, "layout/parts/breadcrumbs.html.twig");
            yield "
            <div class=\"ms-md-auto d-none d-md-block flex-grow-1 flex-md-grow-0\">
                ";
            // line 135
            yield Twig\Extension\CoreExtension::include($this->env, $context, "layout/parts/global_search_form.html.twig");
            yield "
            </div>
         </div>
      </div>
      ";
        }
        // line 140
        yield "
      <div class=\"page-wrapper mb-0\">
         <div class=\"page-body container-fluid\">
            <main role=\"main\" id=\"page\" class=\"legacy\">
";
        return; yield '';
    }

    /**
     * @codeCoverageIgnore
     */
    public function getTemplateName()
    {
        return "layout/parts/page_header.html.twig";
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
        return array (  258 => 140,  250 => 135,  245 => 133,  241 => 131,  239 => 130,  231 => 125,  227 => 123,  220 => 119,  215 => 117,  208 => 113,  197 => 107,  191 => 103,  184 => 99,  177 => 96,  175 => 95,  170 => 93,  167 => 92,  162 => 89,  154 => 84,  150 => 83,  143 => 79,  138 => 77,  134 => 75,  132 => 74,  129 => 73,  123 => 70,  120 => 69,  118 => 68,  116 => 67,  113 => 66,  107 => 63,  104 => 62,  102 => 61,  92 => 56,  84 => 50,  82 => 49,  75 => 45,  70 => 44,  64 => 41,  61 => 40,  59 => 39,  51 => 38,  48 => 37,  46 => 36,  43 => 35,  41 => 34,  38 => 33,);
    }

    public function getSourceContext()
    {
        return new Source("{#
 # ---------------------------------------------------------------------
 #
 # GLPI - Gestionnaire Libre de Parc Informatique
 #
 # http://glpi-project.org
 #
 # @copyright 2015-2025 Teclib' and contributors.
 # @copyright 2003-2014 by the INDEPNET Development Team.
 # @licence   https://www.gnu.org/licenses/gpl-3.0.html
 #
 # ---------------------------------------------------------------------
 #
 # LICENSE
 #
 # This file is part of GLPI.
 #
 # This program is free software: you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
 # the Free Software Foundation, either version 3 of the License, or
 # (at your option) any later version.
 #
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
 # along with this program.  If not, see <https://www.gnu.org/licenses/>.
 #
 # ---------------------------------------------------------------------
 #}

{% set anonymous = session('glpiactiveprofile') is null %}

{% set is_vertical = user_pref('page_layout') == 'vertical' %}

<body class=\"{{ user_pref('fold_menu') and is_vertical ? 'navbar-collapsed' : '' }} {{ is_vertical ? 'vertical-layout' : 'horizontal-layout' }} {{ is_debug_active ? 'debug-active' : '' }}\">
   {% if constant('SKIP_UPDATES') is defined and call('Update::isDbUpToDate') == false %}
      <div class=\"banner-need-update\">
         {{ __(\"You are bypassing a needed update\") }}
      </div>
   {% endif %}
   {{ include('layout/parts/impersonate_banner.html.twig') }}
   {{ include('components/messages_after_redirect_toasts.html.twig', {'display_container': true}) }}

   <div class=\"page\">

      {% if is_vertical %}
      <aside class=\"navbar navbar-vertical navbar-expand-lg sticky-lg-top sidebar\">
         <div class=\"container-fluid\">
            <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbar-menu\">
               <span class=\"navbar-toggler-icon\"></span>
            </button>

            <a href=\"{{ index_path() }}\" accesskey=\"1\" title=\"{{ __('Home') }}\"
               class=\"navbar-brand\">
               <span class=\"glpi-logo\"></span>
            </a>

            {% if not anonymous %}
               <span class=\"d-none d-lg-inline-block\">
                   {{ include('layout/parts/goto_button.html.twig') }}
               </span>
            {% endif %}

            {% if user is not null %}
               {# There may still be a user logged in without a profile or entity. This is seen when they need to reset their password. #}
               <div class=\"d-lg-none\">
                  {{ include('layout/parts/user_header.html.twig') }}
               </div>
            {% endif %}

            {% if not anonymous %}
               <div class=\"collapse navbar-collapse\" id=\"navbar-menu\">
                   <span class=\"d-inline-block d-lg-none ms-2\">
                       {{ include('layout/parts/goto_button.html.twig') }}
                   </span>
                   {{ include('layout/parts/menu.html.twig') }}


                  <p class=\"text-start\">
                     <button class=\"btn btn-sm btn-ghost-secondary  {{ is_debug_active ? 'mb-4' : 'mb-2' }} reduce-menu d-none d-md-block\">
                        <span class=\"menu-label\">{{ __('Collapse menu') }}</span>
                     </button>
                  </p>
               </div>
            {% endif %}
         </div>
      </aside>
      {% endif %}

      <header class=\"navbar d-print-none sticky-lg-top shadow-sm {{ user_pref('page_layout') == 'vertical' ? 'navbar-light navbar-expand-md' : 'navbar-dark navbar-expand-xl topbar' }}\">
         <div class=\"container-fluid flex-xl-nowrap pe-xl-0\">
            {% if user_pref('page_layout') == 'vertical' %}
               {{ include('layout/parts/breadcrumbs.html.twig') }}

                <div class=\"ms-lg-auto d-none d-lg-block flex-grow-1 flex-lg-grow-0\">
                     {{ include('layout/parts/global_search_form.html.twig') }}
                </div>

            {% elseif user_pref('page_layout') == 'horizontal' %}
               <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbar-menu\">
                  <span class=\"navbar-toggler-icon\"></span>
               </button>

               <a href=\"{{ index_path() }}\" accesskey=\"1\" title=\"{{ __('Home') }}\"
                  class=\"navbar-brand\">
                  <span class=\"glpi-logo\"></span>
               </a>

               <div class=\"d-lg-none\">
                  {{ include('layout/parts/user_header.html.twig') }}
               </div>

               <div class=\"collapse navbar-collapse justify-content-center\" id=\"navbar-menu\">
                  {{ include('layout/parts/menu.html.twig') }}
                  <span class=\"ms-xl-2 d-inline-block mt-2 mt-xl-2\">
                     {{ include('layout/parts/goto_button.html.twig') }}
                  </span>
               </div>
            {% endif %}

            <div class=\"ms-md-4 d-none d-lg-block\">
               {{ include('layout/parts/user_header.html.twig') }}
            </div>
         </div>
      </header>

      {% if user_pref('page_layout') == 'horizontal' %}
      <div class=\"navbar navbar-expand-md navbar-light secondary-bar sticky-md-top shadow-sm\">
         <div class=\"container-fluid justify-content-start\">
            {{ include('layout/parts/breadcrumbs.html.twig') }}
            <div class=\"ms-md-auto d-none d-md-block flex-grow-1 flex-md-grow-0\">
                {{ include('layout/parts/global_search_form.html.twig') }}
            </div>
         </div>
      </div>
      {% endif %}

      <div class=\"page-wrapper mb-0\">
         <div class=\"page-body container-fluid\">
            <main role=\"main\" id=\"page\" class=\"legacy\">
", "layout/parts/page_header.html.twig", "/home/u981745852/domains/suporteincv.com/public_html/templates/layout/parts/page_header.html.twig");
    }
}
