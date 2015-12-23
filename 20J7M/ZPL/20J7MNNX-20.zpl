set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.9802, <2> 25.2169, <3> 19.7214, <4> 14.2653, <5> 21.7976, <6> 26.5434, <7> 24.2944, <8> 10.1814, <9> 22.2719, <10> 28.9385, <11> 23.2993, <12> 22.1359, <13> 23.0329, <14> 29.7698, <15> 31.3902, <16> 21.5139, <17> 16.8338, <18> 33.2343, <19> 30.9, <20> 21.343;
param workload[JOB] := <1> 4.5804, <2> 5.0216, <3> 4.4409, <4> 3.7769, <5> 4.6688, <6> 5.152, <7> 4.9289, <8> 3.1908, <9> 4.7193, <10> 5.3795, <11> 4.8269, <12> 4.7049, <13> 4.7993, <14> 5.4562, <15> 5.6027, <16> 4.6383, <17> 4.1029, <18> 5.7649, <19> 5.5588, <20> 4.6198;
param capacity[MACHINE] := <1> 95.9338, <2> 95.9338, <3> 95.9338, <4> 95.9338, <5> 95.9338, <6> 95.9338, <7> 95.9338;

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
