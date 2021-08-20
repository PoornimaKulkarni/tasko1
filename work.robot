*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${message}  Hello
*** Test Cases ***
LoginTest
    open browser    https://mail.google.com/mail/u/0/#inbox  chrome
    Maximize Browser Window
    input text      id:identifierId         aryarachana10@gmail.com
    click element   class:VfPpkd-vQzf8d
    Sleep           5s
    input text      name:password       Fakefake@123
    click element   class:VfPpkd-vQzf8d
    sleep           5s
ComposeTest
    click element   xpath://div[contains(text(), 'Compose')]
    sleep           5s
    input text      xpath:(//textarea[@class='vO'])[1]            poornimakulkarni2806@gmail.com
    sleep           3s
    input text      name:subjectbox                     Test mail
    sleep           5s
    input text      xpath://div[@class="Am Al editable LW-avf tS-tW"]      ${message}
    sleep           5s
    click element   xpath://div[@class="T-I J-J5-Ji aoO v7 T-I-atl L3"]
    sleep           5s
SentmailcheckTest
    click element   xpath://a[@href="https://mail.google.com/mail/u/0/#sent"]
    sleep           5s
    click element   xpath: (//td[@class="xY a4W"])[3]
    sleep           2s
    ${results_on_page}  Get WebElements         xpath:(//div[@class="a3s aiL "])[1]
    FOR        ${elements}       IN      @{results_on_page}
    ${text}=     Get Text       ${elements}
    Log To Console     ${text}
    END
DeletionTest
    sleep       10s
    click element      xpath:(//div[@class="asa"])[24]
    sleep       5s
    click element      xpath://span[@class="ait"]
    sleep       3s
    click element     xpath://a[contains(text(), 'Trash')]
    sleep       3s
    click element      xpath:(//td[@class="xY a4W"])[6]