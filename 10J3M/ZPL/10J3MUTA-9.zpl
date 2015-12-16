set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.0764, <2> 36.1481, <3> 21.2151, <4> 26.5139, <5> 18.6953, <6> 16.328, <7> 41.0306, <8> 22.6563, <9> 13.2902, <10> 39.0719;
param workload[JOB] := <1> 444.2146, <2> 1306.6851, <3> 450.0805, <4> 702.9869, <5> 349.5142, <6> 266.6036, <7> 1683.5101, <8> 513.3079, <9> 176.6294, <10> 1526.6134;
param capacity[MACHINE] := <1> 1855.0364, <2> 1855.0364, <3> 1855.0364;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
