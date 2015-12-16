set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.109, <2> 24.1988, <3> 36.922, <4> 29.2026, <5> 25.6086, <6> 20.6529, <7> 26.7002, <8> 30.9993, <9> 20.4056, <10> 28.97, <11> 23.6767, <12> 19.1403, <13> 31.3536, <14> 21.3582, <15> 28.5479, <16> 26.284, <17> 25.5576, <18> 30.1681, <19> 18.127, <20> 27.894;
param workload[JOB] := <1> 5.0109, <2> 4.9192, <3> 6.0763, <4> 5.4039, <5> 5.0605, <6> 4.5445, <7> 5.1672, <8> 5.5677, <9> 4.5173, <10> 5.3824, <11> 4.8659, <12> 4.375, <13> 5.5994, <14> 4.6215, <15> 5.343, <16> 5.1268, <17> 5.0555, <18> 5.4925, <19> 4.2576, <20> 5.2815;
param capacity[MACHINE] := <1> 16.9448, <2> 16.9448, <3> 16.9448, <4> 16.9448, <5> 16.9448, <6> 16.9448;

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
