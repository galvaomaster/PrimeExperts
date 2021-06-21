*** Settings ***
Documentation     Aqui estarão os elementos mapeados
...               do Site.

*** Variables ***
${menu_site}             xpath=//*[@id="block_top_menu"]/ul
${campo_pesquisa}        name=search_query
${botao_pesquisa}        name=submit_search
${resultado_pesquisa}    xpath=//*[@id="center_column"]/h1
${imagem_produto}        xpath=//*[@id="center_column"]//*[@src="${URL}/img/p/7/7-home_default.jpg"]
${link_produto}          xpath=//*[@id="center_column"]//*[@class="product-name"]
${mensagem_produto}      xpath=//div//p[@class='alert alert-warning']
${mouse_over}            css=ul>li>
${subcategoria}          xpath=//ul[@class='submenu-container clearfix first-in-line-xs']//ul//li//a[@title='Summer Dresses']
${prd_subcategoria}      xpath=//h1//span[@class='cat-name']
${contem_produtos}       xpath=//h1//span[@class='heading-counter']
${btn_login}             xpath=//a[@class='login']
${tela_autenticacao}     xpath=//h1[@class='page-heading'][contains(text(),'Authentication')]
${input_email}           id=email_create
${btn_criar_conta}       id=SubmitCreate
${tela_criar_conta}      xpath=//h3[@class='page-subheading'] [contains(text(),'Your personal information')]
${check_btn_genero}      id=id_gender1
${nome_cliente}          id=customer_firstname
${sobrenome_cliente}     id=customer_lastname
${senha}                 id=passwd
${fistname}              id=firstname
${lastname}              id=lastname
${endereco}              id=address1
${cidade}                id=city
${estado}                xpath=//*[@id='id_state']//option[@value='1']
${pais}                  xpath=//*[@id='id_country']//option[@value='21']
${telefone}              id=phone_mobile  
${alias_endereco}        id=alias
${btn_submeter_conta}    id=submitAccount 
${tela_conta}            xpath=//h1[@class='page-heading'][contains(text(),'My account')]
${cep}                   id=postcode 
