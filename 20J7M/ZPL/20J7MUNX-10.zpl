set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.1511, <2> 8.1879, <3> 15.676, <4> 23.508, <5> 20.618, <6> 8.346, <7> 46.2451, <8> 2.2298, <9> 2.6249, <10> 27.1999, <11> 16.6453, <12> 47.381, <13> 7.7198, <14> 22.3367, <15> 13.7475, <16> 47.0288, <17> 29.0152, <18> 27.6096, <19> 29.2762, <20> 11.1307;
param workload[JOB] := <1> 6.3365, <2> 2.8615, <3> 3.9593, <4> 4.8485, <5> 4.5407, <6> 2.8889, <7> 6.8004, <8> 1.4933, <9> 1.6202, <10> 5.2154, <11> 4.0799, <12> 6.8834, <13> 2.7785, <14> 4.7262, <15> 3.7078, <16> 6.8578, <17> 5.3866, <18> 5.2545, <19> 5.4107, <20> 3.3363;
param capacity[MACHINE] := <1> 88.9864, <2> 88.9864, <3> 88.9864, <4> 88.9864, <5> 88.9864, <6> 88.9864, <7> 88.9864;

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
