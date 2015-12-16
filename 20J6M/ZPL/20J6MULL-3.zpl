set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 49.5748, <2> 16.0818, <3> 18.708, <4> 6.6324, <5> 47.2261, <6> 12.9806, <7> 47.7198, <8> 2.2811, <9> 27.2065, <10> 38.2575, <11> 31.0398, <12> 21.9081, <13> 39.5708, <14> 26.6403, <15> 9.1798, <16> 17.867, <17> 13.807, <18> 35.4799, <19> 26.7086, <20> 31.8315;
param workload[JOB] := <1> 49.5748, <2> 16.0818, <3> 18.708, <4> 6.6324, <5> 47.2261, <6> 12.9806, <7> 47.7198, <8> 2.2811, <9> 27.2065, <10> 38.2575, <11> 31.0398, <12> 21.9081, <13> 39.5708, <14> 26.6403, <15> 9.1798, <16> 17.867, <17> 13.807, <18> 35.4799, <19> 26.7086, <20> 31.8315;
param capacity[MACHINE] := <1> 86.7836, <2> 86.7836, <3> 86.7836, <4> 86.7836, <5> 86.7836, <6> 86.7836;

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
