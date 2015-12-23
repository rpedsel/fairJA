set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.8069, <2> 2.8857, <3> 36.2964, <4> 30.4874, <5> 15.2329, <6> 4.7196, <7> 2.2535, <8> 2.9571, <9> 5.5523, <10> 32.2252, <11> 12.0287, <12> 11.2156, <13> 27.8833, <14> 7.0162, <15> 28.5417, <16> 12.3409, <17> 38.9281, <18> 9.7279, <19> 16.2352, <20> 1.4279;
param workload[JOB] := <1> 2.9676, <2> 1.6987, <3> 6.0246, <4> 5.5215, <5> 3.9029, <6> 2.1725, <7> 1.5012, <8> 1.7196, <9> 2.3563, <10> 5.6767, <11> 3.4682, <12> 3.349, <13> 5.2805, <14> 2.6488, <15> 5.3424, <16> 3.513, <17> 6.2392, <18> 3.119, <19> 4.0293, <20> 1.1949;
param capacity[MACHINE] := <1> 10.2466, <2> 10.2466, <3> 10.2466, <4> 10.2466, <5> 10.2466, <6> 10.2466, <7> 10.2466;

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
