set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.0533, <2> 21.6883, <3> 27.7781, <4> 18.7428, <5> 21.1909, <6> 26.8397, <7> 25.0855, <8> 22.3361, <9> 25.9506, <10> 36.1067, <11> 27.9866, <12> 18.9222, <13> 25.9695, <14> 15.5191, <15> 21.7442, <16> 28.3568, <17> 19.8703, <18> 26.9103, <19> 26.0907, <20> 22.6723;
param workload[JOB] := <1> 5.7492, <2> 4.6571, <3> 5.2705, <4> 4.3293, <5> 4.6034, <6> 5.1807, <7> 5.0085, <8> 4.7261, <9> 5.0942, <10> 6.0089, <11> 5.2902, <12> 4.35, <13> 5.096, <14> 3.9394, <15> 4.6631, <16> 5.3251, <17> 4.4576, <18> 5.1875, <19> 5.1079, <20> 4.7615;
param capacity[MACHINE] := <1> 10.5864, <2> 10.5864, <3> 10.5864, <4> 10.5864, <5> 10.5864, <6> 10.5864, <7> 10.5864;

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
