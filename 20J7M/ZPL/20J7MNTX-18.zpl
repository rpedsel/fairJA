set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.8089, <2> 26.1977, <3> 17.8769, <4> 23.9788, <5> 24.7172, <6> 20.4495, <7> 26.6398, <8> 30.382, <9> 24.8483, <10> 25.3513, <11> 23.9143, <12> 21.0299, <13> 32.019, <14> 34.8065, <15> 22.7211, <16> 21.8372, <17> 17.9216, <18> 12.5612, <19> 20.6758, <20> 27.7498;
param workload[JOB] := <1> 4.7759, <2> 5.1184, <3> 4.2281, <4> 4.8968, <5> 4.9716, <6> 4.5221, <7> 5.1614, <8> 5.512, <9> 4.9848, <10> 5.035, <11> 4.8902, <12> 4.5858, <13> 5.6585, <14> 5.8997, <15> 4.7667, <16> 4.673, <17> 4.2334, <18> 3.5442, <19> 4.5471, <20> 5.2678;
param capacity[MACHINE] := <1> 10.4221, <2> 10.4221, <3> 10.4221, <4> 10.4221, <5> 10.4221, <6> 10.4221, <7> 10.4221;

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
