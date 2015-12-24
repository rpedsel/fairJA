set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.3616, <2> 23.8445, <3> 17.9138, <4> 21.6411, <5> 24.4736, <6> 24.2205, <7> 24.4281, <8> 16.8008, <9> 28.7568, <10> 24.2951, <11> 24.44, <12> 31.3464, <13> 25.9685, <14> 30.3741, <15> 22.564, <16> 32.6012, <17> 21.5935, <18> 25.5893, <19> 24.1314, <20> 22.3915;
param workload[JOB] := <1> 5.2308, <2> 4.8831, <3> 4.2325, <4> 4.652, <5> 4.9471, <6> 4.9214, <7> 4.9425, <8> 4.0989, <9> 5.3625, <10> 4.929, <11> 4.9437, <12> 5.5988, <13> 5.0959, <14> 5.5113, <15> 4.7502, <16> 5.7097, <17> 4.6469, <18> 5.0586, <19> 4.9124, <20> 4.732;
param capacity[MACHINE] := <1> 14.1656, <2> 14.1656, <3> 14.1656, <4> 14.1656, <5> 14.1656, <6> 14.1656, <7> 14.1656;

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
