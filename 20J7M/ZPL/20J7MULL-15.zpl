set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 5.184, <2> 3.2549, <3> 2.4021, <4> 20.399, <5> 25.2684, <6> 49.9772, <7> 29.1768, <8> 16.7395, <9> 44.748, <10> 40.714, <11> 26.2504, <12> 48.6169, <13> 36.7916, <14> 37.3369, <15> 42.6978, <16> 46.1487, <17> 37.2139, <18> 21.9142, <19> 27.2166, <20> 1.359;
param workload[JOB] := <1> 5.184, <2> 3.2549, <3> 2.4021, <4> 20.399, <5> 25.2684, <6> 49.9772, <7> 29.1768, <8> 16.7395, <9> 44.748, <10> 40.714, <11> 26.2504, <12> 48.6169, <13> 36.7916, <14> 37.3369, <15> 42.6978, <16> 46.1487, <17> 37.2139, <18> 21.9142, <19> 27.2166, <20> 1.359;
param capacity[MACHINE] := <1> 80.4871, <2> 80.4871, <3> 80.4871, <4> 80.4871, <5> 80.4871, <6> 80.4871, <7> 80.4871;

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
