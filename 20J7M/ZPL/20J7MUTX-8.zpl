set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.0194, <2> 27.3495, <3> 13.7265, <4> 36.5651, <5> 9.3973, <6> 3.0995, <7> 17.1851, <8> 41.8052, <9> 32.8005, <10> 12.7927, <11> 43.2786, <12> 40.5662, <13> 29.8337, <14> 37.7193, <15> 46.9839, <16> 9.8383, <17> 44.5742, <18> 4.273, <19> 8.5248, <20> 36.6783;
param workload[JOB] := <1> 6.4822, <2> 5.2297, <3> 3.7049, <4> 6.0469, <5> 3.0655, <6> 1.7605, <7> 4.1455, <8> 6.4657, <9> 5.7272, <10> 3.5767, <11> 6.5786, <12> 6.3692, <13> 5.462, <14> 6.1416, <15> 6.8545, <16> 3.1366, <17> 6.6764, <18> 2.0671, <19> 2.9197, <20> 6.0563;
param capacity[MACHINE] := <1> 10.55, <2> 10.55, <3> 10.55, <4> 10.55, <5> 10.55, <6> 10.55, <7> 10.55;

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
