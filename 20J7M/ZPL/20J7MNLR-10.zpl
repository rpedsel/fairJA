set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.5955, <2> 22.4825, <3> 23.2126, <4> 27.3736, <5> 20.8225, <6> 25.7626, <7> 19.3917, <8> 14.48, <9> 35.7777, <10> 23.125, <11> 35.55, <12> 27.2053, <13> 22.3806, <14> 21.4958, <15> 35.3742, <16> 12.4376, <17> 32.7662, <18> 26.3045, <19> 30.9311, <20> 27.131;
param workload[JOB] := <1> 42.274, <2> 6.9292, <3> 23.8666, <4> 7.0917, <5> 48.5225, <6> 27.6652, <7> 46.7451, <8> 3.0504, <9> 5.781, <10> 24.9534, <11> 43.9735, <12> 13.7259, <13> 4.746, <14> 27.1786, <15> 20.2821, <16> 41.615, <17> 46.8218, <18> 49.1931, <19> 17.6467, <20> 27.6297;
param capacity[MACHINE] := <1> 75.6702, <2> 75.6702, <3> 75.6702, <4> 75.6702, <5> 75.6702, <6> 75.6702, <7> 75.6702;

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
