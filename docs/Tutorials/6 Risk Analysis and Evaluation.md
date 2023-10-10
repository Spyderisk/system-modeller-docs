# Risk Analysis (2) and Risk Evaluation

## Calculating Risk

In the previous tutorial we explored the core concepts of **Trustworthiness, Threats, Consequences, Impact and Controls**.
When conducting the risk analysis, the SSM tool will automatically consider all these core concepts, along with one further important aspect: **Likelihood**
Likelihood refers to the probability of a certain Threat occurring - some Threats are more common (or more 'likely') than others, and the configuration of your system can increase or decrease the Likelihood Level for any individual Threat. For example, the existing security Controls you added to the model in the previous step will help to reduce the Likelihood of a Threat occurring (while their absence will increase the Likelihood).

SSM calculates risk through a combination of the **Impact** of a Threat and its Consequences and the **Likelihood** of that Threat occurring. For example, a *High Impact* Consequence and a *High Likelihood* Threat will result in a *Very High* risk to your system:

![Risk Values](../images/image%20(34).png)

**NOTE: This is why it is very important to set your Impact levels and existing Controls correctly during the model validation stage – otherwise the risk calculations will be less accurate for your specific system in its business context.**

SSM will automatically calculate the risk of Consequences for every asset in your model (it will also suggest security Controls to mitigate against those risks).
To do this, click on the red 'run' button in the top right of the screen:

![Risk Analysis Run Button](../images/image%20(35).png)

Once the calculations are complete, the button will turn orange and the **Consequences and their Impact** tab in the **Model Summary** panel will display all the risk levels for each Consequence and the affected Asset(s). For each risk SSM provides a **Direct Risk Level** (comprising the Impact Level and the Likelihood Level) in order - with the *most important* risks (those with the highest Direct Risk level) listed first:

![Risk Analysis outcomes](../images/image%20(36).png)

## Analysing Risk

In order to fully understand the Consequence (and the Threats which cause it), it is now important to explore each of the highest **Direct Risk** items listed in the **Consequences and their Impact** tab. Clicking on a Consequence from this list will open the **Consequence Explorer** where you will find detailed information concerning the:

* Consequence
* Root Causes (of the Consequence)
* Direct Causes (of the Consequence)

![Consequences Explorer after risk analysis](../images/image%20(37).png)

Exploring the various Consequences will provide you with a large amount of detail concerning the Threats to your system.

## Risk Evaluation

**NOTE: As the Risk Analyst you should pay attention to the Consequences with the *highest Direct Risk Levels* first as these represent the biggest danger to your system security**

After selecting a Consequence and opening the Consequence Explorer panel, the Threats are listed in the two 'Causes' sections (Root and Direct). Next to each Threat the red warning triangle indicates that this Threat is **unmanaged**, while the number in the circle indicates whether it is a Primary (1) or Secondary (2) Threat. Hovering over a Threat will display a description of the Threat and will highlight in green the affected Assets:

![Threat description and Assets](../images/image%20(38).png)

**NOTE: It is a good idea to start with the Primary Threats and Root Causes as Controlling these is likely to have a positive effect on the Secondary Threats too**

To understand a Threat in more depth, click on the Threat in order to open the **Threat Explorer** panel, where you will find detail on:

* the Threat
* the Likelihood of the Threat occurring
* the Consequences the Threat directly causes (in Direct Consequences)
* the Secondary Consequences
* recommended Controls (in Control Strategies)

![Threat Explorer](../images/image%20(39).png)

In our example system the biggest risk is a *Loss of Confidentiality* of *Customer Data* (the Consequence). The most likely way this would occur is through *Remote access from the Internet to an insecure Router* (the Primary Root cause). We can therefore evaluate that this Threat (and Consequence) should be the first thing we need to address in order to reduce the risk to our system.

## Summary

Running the Risk Analysis function within SSM will automatically calculate the risks levels in your system and present them in highest-risk to lowest-risk order. You are able to explore the Consequences and Threats in depth by clicking a Consequence and then the Threat(s) which causes it. Primary and Root Cause Threats are identified for you. This enables you to easily analyse and evaluate the most important risks to your system security and make decisions on which Threats to address first.

**NOTE: the Consequence / Threat / Controls information is also available as a report, which you (as the Risk Analyst) can use when making the case for investment in cybersecurity at the managerial and/or board levels**
