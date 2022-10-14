# Performance #

Some reference performance numbers. All using a 1 CPU for processing, for high throughputs multiple CPUs can be used, typically filtering by multicast group number

## CME ##
About 2.5Gbps per 1 CPU throughput 
![CME Market Data Gap Performance]/images/mdgap_performance_cme.png)

## EUREX
About 0.9Gbps per 1 CPU throughput
![Eurex Market Data Gap Performance]/images/mdgap_performance_eurex.png)

## NASDAQ
About 0.7Gbps per 1 CPU Throughput
![NASDAQ Market Data Gap Performance]/images/mdgap_performance_nasdaq.png)

## SIAC CTS
SIAC CTS Feed 1.0 Gbps per 1 CPU throughput
![SIAC CTS Market Data Gap Performance]/images/mdgap_performance_cts.png)

## SIAC OPRA

SIAC OPRA Full A/B feed all running on a single 1 CPU. 0.4Gbps. Performance can be improved substantially by distributing the multicast groups to multiple CPUs
![SIAC OPRA Market Data Gap Performance]/images/mdgap_performance_opra.png)
