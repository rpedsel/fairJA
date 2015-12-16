set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.8316, <2> 41.9445, <3> 46.7598, <4> 10.4033, <5> 26.4172, <6> 19.3154, <7> 7.1613, <8> 35.6831, <9> 4.3832, <10> 30.5871, <11> 15.716, <12> 9.1471, <13> 46.4063, <14> 6.7694, <15> 11.3411, <16> 43.3225, <17> 39.7801, <18> 21.3032, <19> 4.894, <20> 18.3936;
param workload[JOB] := <1> 16.8316, <2> 41.9445, <3> 46.7598, <4> 10.4033, <5> 26.4172, <6> 19.3154, <7> 7.1613, <8> 35.6831, <9> 4.3832, <10> 30.5871, <11> 15.716, <12> 9.1471, <13> 46.4063, <14> 6.7694, <15> 11.3411, <16> 43.3225, <17> 39.7801, <18> 21.3032, <19> 4.894, <20> 18.3936;
param capacity[MACHINE] := <1> 76.0933, <2> 76.0933, <3> 76.0933, <4> 76.0933, <5> 76.0933, <6> 76.0933;

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
