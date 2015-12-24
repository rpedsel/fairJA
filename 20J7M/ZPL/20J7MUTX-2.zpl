set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 1.8214, <2> 35.2651, <3> 16.8557, <4> 29.8306, <5> 31.1617, <6> 15.1539, <7> 15.6989, <8> 44.5427, <9> 46.2651, <10> 34.9731, <11> 4.7211, <12> 5.4684, <13> 6.2953, <14> 44.4636, <15> 4.7412, <16> 9.8547, <17> 39.6007, <18> 22.195, <19> 34.878, <20> 10.2006;
param workload[JOB] := <1> 1.3496, <2> 5.9384, <3> 4.1056, <4> 5.4617, <5> 5.5823, <6> 3.8928, <7> 3.9622, <8> 6.674, <9> 6.8018, <10> 5.9138, <11> 2.1728, <12> 2.3385, <13> 2.509, <14> 6.6681, <15> 2.1774, <16> 3.1392, <17> 6.2929, <18> 4.7112, <19> 5.9058, <20> 3.1938;
param capacity[MACHINE] := <1> 9.5133, <2> 9.5133, <3> 9.5133, <4> 9.5133, <5> 9.5133, <6> 9.5133, <7> 9.5133;

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
